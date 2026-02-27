$ErrorActionPreference = "Stop"

$root = Get-Location
$mapPath = Join-Path $root "seo-keyword-map.json"
$sitemapPath = Join-Path $root "sitemap.xml"

if (-not (Test-Path $mapPath)) {
  throw "Missing seo-keyword-map.json"
}

if (-not (Test-Path $sitemapPath)) {
  throw "Missing sitemap.xml"
}

$map = Get-Content $mapPath -Raw | ConvertFrom-Json
$sitemapUrls = Select-String -Path $sitemapPath -Pattern "<loc>(.*?)</loc>" | ForEach-Object {
  $_.Matches.Groups[1].Value
}

$duplicatePrimary = $map.pages | Group-Object primary_keyword | Where-Object { $_.Count -gt 1 }
if ($duplicatePrimary) {
  Write-Host "Duplicate primary keywords found:" -ForegroundColor Red
  $duplicatePrimary | ForEach-Object { Write-Host " - $($_.Name) ($($_.Count))" -ForegroundColor Red }
  exit 1
}

$missingFiles = @()
$missingSitemap = @()

foreach ($page in $map.pages) {
  $path = $page.url_path
  $targetFile = if ($path -eq "/") {
    Join-Path $root "index.html"
  } else {
    $slug = $path.Trim("/").Replace("/", "\")
    Join-Path $root (Join-Path $slug "index.html")
  }

  if (-not (Test-Path $targetFile)) {
    $missingFiles += $path
  }

  $fullUrl = "https://morsecodegenerators.org$path"
  if ($fullUrl -notin $sitemapUrls) {
    $missingSitemap += $fullUrl
  }
}

if ($missingFiles.Count -gt 0) {
  Write-Host "Missing page files:" -ForegroundColor Red
  $missingFiles | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 1
}

if ($missingSitemap.Count -gt 0) {
  Write-Host "Missing URLs in sitemap:" -ForegroundColor Red
  $missingSitemap | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }
  exit 1
}

Write-Host "SEO checks passed:" -ForegroundColor Green
Write-Host " - Primary keywords are unique"
Write-Host " - All mapped pages exist"
Write-Host " - All mapped URLs are present in sitemap"
