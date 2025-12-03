# Implementation Tasks: Personal Website with CV, Writings, and Projects

**Overview**: Build Hugo-based static site with CV, blog, and projects pages, deployed to fly.io via GitHub Actions with Fathom analytics.

**Total Tasks**: 52 | **Phases**: 7 | **Estimated Completion**: 2-3 days

---

## Phase 1: Hugo Site Foundation
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

---

## Phase 2: Content Templates
**Dependencies**: Phase 1 complete
**Parallel Opportunities**: 4

- [ ] T016 [P] Create CV layout layouts/cv/single.html extending baseof.html with block "main" (R01, R02)
- [ ] T017 [P] Create blog list layout layouts/blog/list.html with .Pages.ByDate.Reverse for chronological ordering (R01, R02)
- [ ] T018 Add empty state check to blog list template (if no posts, show "No posts yet" message) (R04)
- [ ] T019 [P] Create blog post layout layouts/blog/single.html with date and title display (R01, R02)
- [ ] T020 [P] Create projects layout layouts/projects/single.html with simple list formatting (R01, R02)
- [ ] T021 Create homepage layout layouts/index.html with introduction and navigation links (R02)
- [ ] T022 Add navigation component to baseof.html header with links to /, /cv, /blog, /projects (R02, R03)
- [ ] T023 Add footer component to baseof.html with copyright and minimal info (R03)
- [ ] T024 Add responsive navigation styles to style.css using flexbox (R03)
- [ ] T025 Verify CV template renders with hugo server (manual: visit /cv, check layout structure) (R02)
- [ ] T026 Verify blog list template with empty state (manual: visit /blog, check "No posts yet" shows) (R02, R04)
- [ ] T027 Verify projects template renders (manual: visit /projects, check layout structure) (R02)
- [ ] T028 Verify homepage renders with navigation (manual: visit /, check all nav links work) (R02)

---

## Phase 3: Sample Content
**Dependencies**: Phase 2 complete
**Parallel Opportunities**: 3

- [ ] T029 [P] Create CV content content/cv/index.md with frontmatter (title: "CV") and sample sections (R01, R02)
- [ ] T030 [P] Create first blog post content/blog/first-post.md with frontmatter (title, date: 2024-12-01, draft: false) (R01, R02)
- [ ] T031 [P] Create second blog post content/blog/second-post.md with frontmatter (title, date: 2024-12-02, draft: false) (R01, R02)
- [ ] T032 Create projects content content/projects/index.md with frontmatter and list of 2-3 sample projects (R01, R02)
- [ ] T033 Verify CV content renders correctly with proper formatting (manual: check /cv shows all sections) (R02)
- [ ] T034 Verify blog index shows both posts in reverse chronological order (manual: check /blog lists second-post first) (R02)
- [ ] T035 Verify individual blog posts render (manual: visit /blog/first-post and /blog/second-post) (R02)
- [ ] T036 Verify projects page renders with all projects (manual: check /projects shows list) (R02)
- [ ] T037 Add responsive typography styles to style.css (media queries for mobile/tablet/desktop) (R03)
- [ ] T038 Add blog list grid layout to style.css using CSS Grid (R03)
- [ ] T039 Verify mobile responsiveness (manual: resize browser to 375px width, check readability) (R03)

---

## Phase 4: Docker Configuration
**Dependencies**: Phase 3 complete
**Parallel Opportunities**: 1

- [ ] T040 Create Dockerfile in root with multi-stage build (Hugo build stage FROM klakegg/hugo:ext-alpine) (R05)
- [ ] T041 Add nginx serve stage to Dockerfile (FROM nginx:alpine, COPY public to /usr/share/nginx/html) (R05)
- [ ] T042 [P] Create .docker/nginx.conf with server block for port 80 (R05)
- [ ] T043 Add caching headers to nginx.conf (Cache-Control for static assets) (R05)
- [ ] T044 Add gzip compression to nginx.conf for text files (R05)
- [ ] T045 Add 404 error page handling to nginx.conf (try_files directive) (R05)
- [ ] T046 Build Docker image locally with `docker build -t timothyvoice-site .` (R05)
- [ ] T047 Run Docker container locally with `docker run -p 8080:80 timothyvoice-site` (R05)
- [ ] T048 Verify all routes work in Docker (manual: visit localhost:8080/, /cv, /blog, /projects) (R02, R05)

---

## Phase 5: fly.io Setup
**Dependencies**: Phase 4 complete
**Parallel Opportunities**: 0

- [ ] T049 Install fly.io CLI with `brew install flyctl` (R05, R06)
- [ ] T050 Authenticate with fly.io using `flyctl auth login` (R06)
- [ ] T051 Create fly.io app with `flyctl launch` (choose app name, region, skip database) (R06)
- [ ] T052 Review generated fly.toml and adjust internal_port to 80 if needed (R06)
- [ ] T053 Set Fathom site ID secret with `flyctl secrets set FATHOM_SITE_ID=XXXXX` (R07)
- [ ] T054 Deploy manually with `flyctl deploy` (R06)
- [ ] T055 Verify deployed site loads at fly.io URL (manual: visit https://your-app.fly.dev) (R02, R06)
- [ ] T056 Verify all pages work on fly.io (manual: test /cv, /blog, /projects routes) (R02, R06)

---

## Phase 6: GitHub Actions CI/CD
**Dependencies**: Phase 5 complete
**Parallel Opportunities**: 0

- [ ] T057 Create .github/workflows/ directory structure (R05)
- [ ] T058 Create .github/workflows/deploy.yml workflow file (R05)
- [ ] T059 Add workflow trigger for push to main branch in deploy.yml (R05)
- [ ] T060 Add Hugo setup step using peaceiris/actions-hugo@v2 with extended: true (R05)
- [ ] T061 Add Hugo build step with `hugo --minify` command (R05)
- [ ] T062 Add fly.io deployment step using superfly/flyctl-actions/setup-flyctl@master (R05, R06)
- [ ] T063 Add flyctl deploy command to workflow with FLY_API_TOKEN secret (R06)
- [ ] T064 Get fly.io API token with `flyctl auth token` and save for GitHub (R06)
- [ ] T065 Add FLY_API_TOKEN to GitHub repository secrets (Settings > Secrets > Actions) (R06)
- [ ] T066 Commit workflow file and push to main branch to trigger deployment (R05)
- [ ] T067 Monitor GitHub Actions tab for workflow execution (check for errors) (R05)
- [ ] T068 Verify automatic deployment completed successfully (check fly.io app updated) (R05, R06)

---

## Phase 7: Analytics Integration
**Dependencies**: Phase 6 complete
**Parallel Opportunities**: 0

- [ ] T069 Update baseof.html Fathom script tag to use async attribute for non-blocking load (R07)
- [ ] T070 Verify FATHOM_SITE_ID environment variable accessible in template (check {{ .Site.Params.fathomSiteId }}) (R07)
- [ ] T071 Add fallback handling if FATHOM_SITE_ID missing (only render script if param exists) (R04, R07)
- [ ] T072 Commit Fathom integration changes and push to trigger deployment (R07)
- [ ] T073 Verify Fathom script loads in production (manual: check browser Network tab on fly.io URL) (R07)
- [ ] T074 Test Fathom tracking fires (manual: visit site, check Fathom dashboard for pageview) (R07)
- [ ] T075 Add README.md documentation for updating Fathom site ID in fly.io secrets (R07)
- [ ] T076 Add README.md section for Hugo version pinning in GitHub Actions (R05)
- [ ] T077 Add README.md section for local development setup (hugo server instructions) (R01)

---

## Spec Requirement Mapping

- R01: Tasks T001-T003, T006-T007, T029-T032, T077 (Hugo site structure, content directories, sample content)
- R02: Tasks T004, T008, T011, T016-T028, T033-T036, T048, T055-T056 (Templates, layouts, content rendering)
- R03: Tasks T009, T012-T015, T022-T024, T037-T039 (CSS styling, typography, responsive design)
- R04: Tasks T018, T026, T071 (Edge cases: empty blog, missing Fathom ID)
- R05: Tasks T040-T048, T057-T061, T066-T068, T076 (Docker, GitHub Actions CI/CD)
- R06: Tasks T049-T056, T062-T065, T068 (fly.io deployment)
- R07: Tasks T005, T010, T053, T069-T075 (Fathom Analytics integration)

---

## Critical Dependencies

- **Hugo site must exist before templates**: T003 blocks T008
- **Base template must exist before section templates**: T008 blocks T016-T021
- **Templates must exist before content verification**: T016-T028 block T033-T036
- **Content must exist before Docker testing**: T029-T032 block T046-T048
- **Docker must work before fly.io setup**: T046-T048 block T049-T056
- **fly.io must work before GitHub Actions**: T049-T056 block T057-T068
- **Deployment pipeline must work before analytics testing**: T057-T068 block T073-T074

---

## Notes

- **Homebrew installation**: Assumes macOS development environment (brew install commands)
- **Manual verification**: Tasks use "manual:" prefix to indicate verification steps performed in browser/terminal
- **Hugo version**: Will use latest stable Hugo Extended from Homebrew (document specific version in README)
- **Parallel opportunities**: Tasks marked [P] can be worked simultaneously (different files, no dependencies)
- **Image handling**: Not included in initial tasks; document in README to store images in static/images/ directory
- **Pagination**: Not implemented initially; monitor blog post count and add if exceeds 50 posts per edge cases
- **Error notifications**: GitHub Actions sends email notifications by default on workflow failure
