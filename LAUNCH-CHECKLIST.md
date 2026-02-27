# Cloudflare Pages Launch Checklist

## 1) Domain configuration
Production domain is set to `morsecodegenerators.org`:

- `index.html`
  - Canonical/OG/JSON-LD point to `https://morsecodegenerators.org/`.
- `robots.txt`
  - Sitemap points to `https://morsecodegenerators.org/sitemap.xml`.
- `sitemap.xml`
  - URL entry uses `https://morsecodegenerators.org/`.
- `_redirects`
  - Redirects `www.morsecodegenerators.org` to apex.

## 2) Cloudflare Pages project settings
- Framework preset: None
- Build command: none
- Output directory: repository root

## 3) Domain and redirects
- Add custom domain in Cloudflare Pages.
- Keep apex as canonical host.
- Redirect `www` to apex with 301 (already configured in `_redirects` after domain replacement).
- Configure redirect from `*.pages.dev` to custom domain via Cloudflare Bulk Redirects.

## 4) Analytics
- Enable Cloudflare Web Analytics from Pages > Metrics.

## 5) Search setup
- Add domain property in Google Search Console.
- Submit `https://morsecodegenerators.org/sitemap.xml` after deployment.

## 6) Post-launch checks
- Confirm `/robots.txt` and `/sitemap.xml` are publicly accessible.
- Confirm `X-Robots-Tag: noindex` is returned on `*.pages.dev` URL.
- Validate structured data JSON-LD syntax.
- Run Lighthouse mobile audit and check Performance/SEO baselines.
