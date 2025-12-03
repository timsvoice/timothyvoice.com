# Phase 5: fly.io Setup

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
