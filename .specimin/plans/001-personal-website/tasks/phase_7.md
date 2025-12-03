# Phase 7: Analytics Integration

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
