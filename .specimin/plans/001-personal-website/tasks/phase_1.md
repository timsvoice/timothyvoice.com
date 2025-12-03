# Phase 1: Hugo Site Foundation

**Dependencies**: None
**Parallel Opportunities**: 0

- [ ] T001 Install Hugo Extended via Homebrew with `brew install hugo` (R01)
- [ ] T002 Verify Hugo installation with `hugo version` (minimum v0.112.0) (R01)
- [ ] T003 Initialize Hugo site structure with `hugo new site . --force` in project root (R01)
- [ ] T004 Create hugo.toml with site metadata (baseURL, title, languageCode) in root (R01, R02)
- [ ] T005 Add Fathom params section to hugo.toml for site ID injection (R07)
- [ ] T006 Create content directory structure: content/cv/, content/blog/, content/projects/ (R01, R02)
- [ ] T007 Create layouts directory structure: layouts/_default/, layouts/cv/, layouts/blog/, layouts/projects/ (R01)
- [ ] T008 Create base layout template layouts/_default/baseof.html with HTML5 skeleton (R02, R03)
- [ ] T009 Add IBM Plex Sans font loading to baseof.html head with preconnect and font-display swap (R03)
- [ ] T010 Add Fathom script placeholder in baseof.html using site params (R07)
- [ ] T011 Verify base template structure with `hugo server` (manual: check localhost:1313 loads without errors) (R02)
- [ ] T012 Create static/css/style.css with CSS reset and IBM Plex font stack (R03)
- [ ] T013 Add typography scale (font sizes, line heights, weights) to style.css (R03)
- [ ] T014 Add basic layout styles (max-width, margins, padding) to style.css (R03)
- [ ] T015 Verify CSS loads correctly in browser dev tools (manual: check Network tab shows style.css loaded) (R03)
