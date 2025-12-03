# Phase 6: GitHub Actions CI/CD

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
