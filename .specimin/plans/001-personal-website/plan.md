# Implementation Plan: Personal Website with CV, Writings, and Projects

## Technical Context

**Existing**: Greenfield project, git repository initialized with main branch, no existing codebase

**Detected**: No frameworks or dependencies currently in place

**Decisions Made**:
- Static Site Generator: Hugo (Go-based)
- Templating: Hugo's built-in template system
- Typography: IBM Plex Sans/Mono via Google Fonts
- Content Structure: Organized by type (`content/cv/`, `content/blog/`, `content/projects/`)
- Deployment: Dockerfile with nginx for efficient static file serving
- Analytics Config: Fathom site ID via environment variable

## Decision Exploration

### Static Site Generator Selection

**Options Considered**:
- Hugo (Go): Extremely fast builds, single binary, excellent Markdown support
- 11ty (JavaScript): Flexible but slower, more dependencies
- Custom solutions: More control but significant development time

**Selected**: Hugo

**Rationale**: Hugo aligns perfectly with requirements for speed, minimal complexity, and Go preference. Single binary deployment simplifies CI/CD. Built-in Markdown processing, taxonomies for blog posts, and template inheritance eliminate need for custom tooling. Hugo's development server with live reload accelerates content authoring workflow.

### Deployment Architecture

**Options Considered**:
- Dockerfile + nginx: Full control, battle-tested static serving
- Same-language HTTP server: Simpler but less optimized
- Buildpacks: Automatic but less transparent

**Selected**: Dockerfile with nginx

**Rationale**: Static sites benefit significantly from nginx's performance characteristics and mature caching headers. Explicit Dockerfile ensures reproducible builds and clear deployment pipeline. Control over nginx configuration enables security headers, proper 404 handling, and optimized asset delivery for Fathom analytics script.

### Typography Strategy

**Options Considered**:
- System fonts: Zero latency but inconsistent
- Google Fonts (Inter, IBM Plex): Consistent, cached by CDN
- Self-hosted fonts: Control but adds hosting burden

**Selected**: IBM Plex Sans/Mono via Google Fonts

**Rationale**: IBM Plex provides professional appearance suitable for technical/personal branding. Sans variant for body text, Mono for code snippets if needed. Google Fonts CDN ensures fast delivery with likely cache hits. Single font family maintains "minimal styling" philosophy while providing necessary weights for hierarchy.

## Solution Architecture

The system follows a static site generation pattern where Markdown content is transformed at build time into optimized HTML. Hugo processes content from structured directories (`content/cv/`, `content/blog/`, `content/projects/`) using layout templates that define consistent page structure. Base templates provide shared navigation and footer, while section-specific templates handle CV formatting, blog post listings with reverse chronological ordering, and project displays.

Build pipeline executes in GitHub Actions on push to main branch: Hugo generates static HTML/CSS to `public/` directory, Dockerfile copies built assets into nginx container, and fly.io deploys the containerized application. Nginx serves pre-rendered files with optimized caching headers and injects Fathom analytics script using environment variable for site ID.

Content authoring workflow is simple: create or edit Markdown files with frontmatter (title, date, draft status), commit to git, push to main. GitHub Actions handles build and deployment automatically, typically completing within 2-3 minutes. Local development uses `hugo server` for live preview with hot reload.

Typography loads IBM Plex from Google Fonts with `font-display: swap` to prevent layout shift. Vanilla CSS stylesheet defines minimal design system: typography scale, spacing rhythm, and responsive layout using CSS Grid for blog index and flexbox for navigation. No JavaScript required except Fathom's tracking snippet.

## Technology Decisions

- **Static Site Generator**: Hugo (latest stable version via Hugo Extended for asset processing)
- **Font Loading**: IBM Plex Sans (regular, medium weights) via Google Fonts CDN with preconnect
- **Web Server**: nginx:alpine (minimal image size, ~5MB compressed)
- **Container Base**: Multi-stage Docker build (Hugo build stage + nginx serve stage)
- **GitHub Actions**: Official Hugo setup action + fly.io deployment action
- **fly.io Configuration**: Single instance, auto-stop when idle, fly.toml defines app config
- **Fathom Integration**: Environment variable `FATHOM_SITE_ID` injected into base template

## Component Modifications

None (greenfield project)

## New Components

1. **Hugo Site Structure** (`/`): Root Hugo site with config, content directories, layouts, and static assets
2. **Hugo Configuration** (`hugo.toml`): Site config including baseURL, title, build settings, and params for Fathom
3. **Content Directories** (`content/cv/`, `content/blog/`, `content/projects/`): Markdown source files organized by content type
4. **Base Layout Template** (`layouts/_default/baseof.html`): HTML skeleton with head, navigation, main content block, footer
5. **CV Layout** (`layouts/cv/single.html`): Template for rendering CV page from Markdown
6. **Blog List Layout** (`layouts/blog/list.html`): Template for blog index with posts sorted by date descending
7. **Blog Post Layout** (`layouts/blog/single.html`): Template for individual blog post pages
8. **Projects Layout** (`layouts/projects/single.html`): Template for projects page with simple list display
9. **Homepage Layout** (`layouts/index.html`): Landing page with introduction and links to main sections
10. **Stylesheet** (`static/css/style.css`): Vanilla CSS with typography, layout, and responsive design
11. **Dockerfile** (root): Multi-stage build using Hugo image to build site, nginx:alpine to serve
12. **nginx Configuration** (`.docker/nginx.conf`): Server config with caching headers, gzip, and SPA routing
13. **GitHub Actions Workflow** (`.github/workflows/deploy.yml`): Build and deployment pipeline to fly.io
14. **fly.io Configuration** (`fly.toml`): App name, region, HTTP service config, environment variables
15. **Sample Content**: Initial CV markdown, 1-2 example blog posts, projects page

## Task Sequence

### Phase 1: Hugo Site Foundation
1. Install Hugo Extended locally for development
2. Initialize Hugo site structure with `hugo new site`
3. Create `hugo.toml` with site metadata and configuration
4. Create content directory structure (`content/cv/`, `content/blog/`, `content/projects/`)
5. Create base layout template (`layouts/_default/baseof.html`) with HTML5 skeleton, IBM Plex font loading, and Fathom script placeholder
6. Create initial CSS stylesheet (`static/css/style.css`) with IBM Plex font stack, typography scale, and basic layout

**Dependencies**: None

### Phase 2: Content Templates
7. Create CV layout template (`layouts/cv/single.html`) extending base layout
8. Create blog list template (`layouts/blog/list.html`) with `.Pages.ByDate.Reverse` for chronological ordering
9. Create blog post template (`layouts/blog/single.html`) with date and reading time display
10. Create projects layout (`layouts/projects/single.html`) with simple list formatting
11. Create homepage layout (`layouts/index.html`) with welcome content and navigation
12. Test templates with sample content locally using `hugo server`

**Dependencies**: Phase 1 (base layout and CSS must exist)

### Phase 3: Sample Content
13. Create CV content (`content/cv/index.md`) with frontmatter and Markdown sections
14. Create 2 sample blog posts (`content/blog/post-1.md`, `content/blog/post-2.md`) with title, date, and draft status
15. Create projects page (`content/projects/index.md`) with list of projects
16. Verify content renders correctly in local development server
17. Refine CSS for readability, spacing, and mobile responsiveness

**Dependencies**: Phase 2 (templates must exist to render content)

### Phase 4: Docker Configuration
18. Create Dockerfile with multi-stage build (Hugo build stage + nginx serve stage)
19. Create nginx configuration (`.docker/nginx.conf`) with caching headers, gzip compression, and 404 handling
20. Build Docker image locally and test serving static files
21. Verify all routes work correctly (/, /cv, /blog, /blog/post-1, /projects)

**Dependencies**: Phase 3 (content must exist to build and test)

### Phase 5: fly.io Setup
22. Install fly.io CLI locally
23. Run `flyctl launch` to create fly.io app and generate `fly.toml`
24. Configure `fly.toml` with app settings (region, HTTP service, internal port 80)
25. Set Fathom site ID secret: `flyctl secrets set FATHOM_SITE_ID=your_site_id`
26. Deploy manually to verify: `flyctl deploy`
27. Test deployed site at fly.io URL

**Dependencies**: Phase 4 (Docker image must be working)

### Phase 6: GitHub Actions CI/CD
28. Create `.github/workflows/deploy.yml` workflow file
29. Configure workflow triggers (push to main branch)
30. Add Hugo setup action and build step
31. Add fly.io deployment action with `FLY_API_TOKEN` secret
32. Add `FLY_API_TOKEN` to GitHub repository secrets
33. Test workflow by pushing to main branch
34. Verify automatic deployment completes successfully

**Dependencies**: Phase 5 (fly.io app must be configured and tested)

### Phase 7: Analytics Integration
35. Update base layout template to inject Fathom script using site params
36. Configure Hugo to pass `FATHOM_SITE_ID` environment variable to templates
37. Test Fathom tracking in deployed environment (check Fathom dashboard)
38. Add documentation for updating Fathom site ID in fly.io secrets

**Dependencies**: Phase 6 (deployment pipeline must be working)

## Integration Points

- **GitHub Actions + fly.io**: Workflow uses `fly.io/actions/deploy` action with `FLY_API_TOKEN` secret for authenticated deployment
- **Hugo + nginx**: Hugo builds to `public/` directory, Dockerfile copies to nginx `/usr/share/nginx/html`
- **Fathom Analytics**: JavaScript snippet loaded from `cdn.usefathom.com` with site ID from environment variable
- **Google Fonts**: CDN link in HTML `<head>` with `preconnect` hint for performance

## Testing Strategy

**Unit**: Not applicable for static site (no application logic to unit test)

**Integration**:
- Test Hugo build completes without errors (`hugo --minify`)
- Verify all content files render to HTML in `public/` directory
- Test Docker image builds successfully and nginx serves files
- Verify environment variable injection for Fathom site ID

**E2E**:
- Manual browser testing of all pages (CV, blog index, individual posts, projects)
- Test navigation links between pages
- Verify responsive design on mobile and desktop viewport sizes
- Confirm Fathom analytics tracking fires on page views

**Edge Cases**:
- Empty blog directory (no posts): Blog index should display placeholder message
- Malformed frontmatter: Hugo build should fail with clear error message in GitHub Actions
- Missing Fathom site ID: Page should render, tracking script should handle gracefully
- Very long blog post list: Monitor build time, consider pagination if exceeds 50 posts

## Risks & Mitigation

**Risk**: Hugo version mismatch between local development and GitHub Actions
**Mitigation**: Pin Hugo version in GitHub Actions workflow and document required version in README

**Risk**: fly.io deployment fails silently or with unclear errors
**Mitigation**: Add explicit status checks in GitHub Actions workflow, configure notifications for deployment failures

**Risk**: Fathom script blocks page rendering if CDN is slow
**Mitigation**: Use `async` attribute on script tag, consider `font-display: swap` to prevent font loading from blocking

**Risk**: Docker image size grows large with unnecessary dependencies
**Mitigation**: Use multi-stage build to separate build-time and runtime dependencies, use alpine-based images

**Risk**: Content with malformed Markdown or frontmatter breaks builds
**Mitigation**: Hugo validates frontmatter at build time and fails fast, GitHub Actions will prevent deployment of broken builds

**Risk**: No HTTPS/TLS configuration specified
**Mitigation**: fly.io provides automatic TLS certificates for deployed apps (included by default)

**Risk**: Images in Markdown files not loading correctly
**Mitigation**: Document image path conventions (store in `static/images/`, reference as `/images/file.png`), test with sample image in initial content
