# Personal Website with CV, Writings, and Projects

**Objective**

Create a personal website that hosts a CV, blog-style writings, and project listings, with automated deployment to fly.io when changes are pushed to the main branch.

**Context**

Timothy Voice needs an online presence to showcase professional experience, share written content, and display projects. The site should be easy to maintain (write in Markdown), fast to load (minimal styling), and automatically deploy when content is updated.

**Assumptions**

- Content will be written in Markdown files stored in the git repository
- Updates to content happen by editing Markdown files and pushing to main branch
- Blog posts follow standard frontmatter conventions (title, date, etc.)
- Minimal JavaScript required; primary focus is content delivery
- fly.io account exists or will be created
- Fathom Analytics account exists or will be created for tracking
- GitHub repository will be hosted on GitHub.com for Actions integration
- Technology preference: Go, Elixir, or JavaScript-based tooling
- Static site generator should be simple to customize and maintain

**Constraints**

- Must use vanilla CSS only (no CSS frameworks)
- Must convert Markdown to HTML at build time (static site generation)
- Must deploy automatically via GitHub Actions on push to main branch
- Must host on fly.io
- Must include Fathom Analytics tracking
- Must use a single "good font" for typography
- Must maintain fast load times and minimal styling philosophy

**Acceptance Criteria**

- Visitor can navigate to dedicated `/cv` page displaying CV content from Markdown
- Visitor can view blog index page listing all writings in reverse chronological order
- Visitor can click on blog post to read full content on dedicated page
- Visitor can view projects page with simple list and descriptions
- Pushing Markdown changes to main branch triggers automatic deployment to fly.io
- Deployed site loads successfully at fly.io URL
- Fathom Analytics tracks page visits without impacting page load performance
- All pages render with consistent vanilla CSS styling and chosen font
- Site works on mobile and desktop browsers

**User Scenarios**

1. **CV Viewing**: Visitor navigates to `/cv` → Sees formatted CV from Markdown → Can share single URL with others
2. **Reading Blog**: Visitor lands on writings index → Sees list of posts with titles and dates → Clicks post → Reads full article
3. **Browsing Projects**: Visitor navigates to projects page → Sees list of projects with brief descriptions
4. **Content Update**: Timothy edits Markdown file → Commits and pushes to main → GitHub Actions builds site → New content appears on fly.io within minutes
5. **Analytics Review**: Timothy checks Fathom dashboard → Sees visitor counts and page views → Makes content decisions based on data

**Edge Cases**

- Empty blog (no posts yet) - should display placeholder or empty state
- Malformed Markdown frontmatter - build should fail with clear error message
- GitHub Actions deployment failure - should notify via email/GitHub interface
- fly.io downtime - beyond control, but deployment script should handle errors gracefully
- Missing Fathom Analytics credentials - site should still render, tracking fails silently or shows warning
- Very long blog post list - consider pagination threshold (e.g., 50+ posts)
- Images in Markdown - must be stored in repository and referenced correctly

**Dependencies**

- GitHub repository with Actions enabled
- fly.io account and CLI access for initial setup
- Fathom Analytics account and site ID
- Domain name (optional, can use fly.io subdomain initially)
- Static site generator tool compatible with Markdown and vanilla CSS

**Out of Scope**

- Content management system (CMS) or admin interface
- Comments on blog posts
- RSS feed generation (can be added later)
- Search functionality
- Dark mode toggle
- PDF download of CV (web view only)
- Email newsletter integration
- Social media integration beyond simple links
- Multi-language support
- Dynamic contact forms
