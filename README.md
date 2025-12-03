# Timothy Voice - Personal Website

A minimal, fast-loading personal website built with Hugo and deployed to fly.io.

## Features

- **Static Site Generation**: Hugo-powered with fast build times
- **Minimal Design**: Vanilla CSS with IBM Plex typography
- **Automated Deployment**: GitHub Actions CI/CD pipeline
- **Privacy-Focused Analytics**: Fathom Analytics integration
- **Docker**: Containerized with nginx for optimal performance

## Technology Stack

- **Hugo** v0.152.2 Extended (Go-based static site generator)
- **IBM Plex Sans/Mono** (Google Fonts)
- **Docker** + **nginx:alpine**
- **GitHub Actions**
- **fly.io** (hosting)
- **Fathom Analytics**

## Local Development

### Prerequisites

- Hugo Extended v0.152.2 or later
- Git

### Setup

```bash
# Clone the repository
git clone <your-repo-url>
cd timothyvoice

# Start the Hugo development server
hugo server

# Visit http://localhost:1313
```

### Hugo Version

This project uses Hugo v0.152.2 Extended. The version is pinned in the GitHub Actions workflow to ensure consistent builds.

## Project Structure

```
.
├── .docker/
│   └── nginx.conf           # nginx configuration
├── .github/
│   └── workflows/
│       └── deploy.yml       # CI/CD pipeline
├── content/
│   ├── blog/                # Blog posts
│   ├── cv/                  # CV page
│   └── projects/            # Projects page
├── layouts/
│   ├── _default/
│   │   └── baseof.html      # Base template
│   ├── blog/                # Blog templates
│   ├── cv/                  # CV template
│   ├── projects/            # Projects template
│   └── index.html           # Homepage
├── static/
│   └── css/
│       └── style.css        # Vanilla CSS styles
├── Dockerfile               # Multi-stage Docker build
└── hugo.toml                # Hugo configuration
```

## Content Management

### Creating New Blog Posts

```bash
# Create a new blog post
hugo new content/blog/my-new-post.md
```

Edit the generated file and set `draft: false` when ready to publish.

### Updating CV

Edit `content/cv/index.md` directly.

### Adding Projects

Edit `content/projects/index.md` directly.

## Deployment

### fly.io Setup

1. **Install fly.io CLI**:
   ```bash
   brew install flyctl
   ```

2. **Authenticate**:
   ```bash
   flyctl auth login
   ```

3. **Create fly.io app**:
   ```bash
   flyctl launch
   # Follow prompts:
   # - Choose app name
   # - Select region
   # - Skip database setup
   ```

4. **Set Fathom Analytics site ID** (optional):
   ```bash
   flyctl secrets set FATHOM_SITE_ID=YOUR_SITE_ID
   ```

5. **Deploy manually** (first time):
   ```bash
   flyctl deploy
   ```

### GitHub Actions Setup

1. **Get fly.io API token**:
   ```bash
   flyctl auth token
   ```

2. **Add token to GitHub secrets**:
   - Go to repository Settings > Secrets and variables > Actions
   - Click "New repository secret"
   - Name: `FLY_API_TOKEN`
   - Value: (paste the token from step 1)

3. **Push to main branch**:
   ```bash
   git push origin main
   ```

   The GitHub Actions workflow will automatically build and deploy your site.

## Updating Fathom Analytics

To change the Fathom Analytics site ID:

```bash
flyctl secrets set FATHOM_SITE_ID=YOUR_NEW_SITE_ID
```

The site will automatically redeploy with the new analytics configuration.

## Docker

### Build locally

```bash
docker build -t timothyvoice-site .
```

### Run locally

```bash
docker run -p 8080:80 timothyvoice-site
# Visit http://localhost:8080
```

## Customization

### Styling

Edit `static/css/style.css` for design changes. The CSS uses CSS custom properties (variables) for easy customization:

```css
:root {
    --font-sans: 'IBM Plex Sans', ...;
    --color-text: #1a1a1a;
    --max-width: 720px;
    --spacing-unit: 1.5rem;
}
```

### Typography

To change fonts, update the Google Fonts link in `layouts/_default/baseof.html` and the font-family in `style.css`.

### Base URL

Update `baseURL` in `hugo.toml` when deploying to a custom domain:

```toml
baseURL = 'https://yourdomain.com/'
```

## License

All rights reserved.
