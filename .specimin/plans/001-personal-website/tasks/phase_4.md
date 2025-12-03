# Phase 4: Docker Configuration

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
