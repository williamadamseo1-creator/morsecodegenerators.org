# SEO Implementation Guide

## Editorial Rules
- One page maps to one `primary_keyword`.
- Keep `secondary_keywords` to 3-8 natural mentions.
- Do not add keyword blocks or repetitive stuffing.
- Exclude off-topic commercial intents (bracelet, necklace, tattoo).
- Exclude offensive phrase queries for brand safety.

## Page Template
Every cluster page should include:
1. Intent intro with one H1.
2. Converter CTA above the fold (`/#converter`).
3. Step-by-step usage section.
4. Example list (5-10 examples).
5. Common mistakes section.
6. FAQ section (4-6 entries).
7. Related links widget:
   - Related translators
   - Related practice queries
   - Common phrase/reference pages

## Internal Linking Rules
- Every page links to homepage converter.
- Every page links to one parent hub and at least two sibling pages.
- Avoid identical anchor repetition across all pages.

## QA and Test Scenarios
- Cannibalization: no duplicate `primary_keyword` in `seo-keyword-map.json`.
- Relevance: page content intent matches one of:
  - `translator`
  - `reference`
  - `phrase`
  - `learning`
  - `media`
- Quality: reject pages that are mostly duplicated wording.
- Indexing: ensure URLs are included in `sitemap.xml`.
- CTR optimization: review top impressions pages weekly in Search Console.

## Measurement Cadence
- Weekly:
  - Impressions
  - Clicks
  - Average position by URL
- Monthly:
  - Refresh keyword prioritization using latest CSV export.
  - Update `seo-keyword-map.json` and publish next 12 pages.
