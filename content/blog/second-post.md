---
title: "Building a Personal Website"
date: 2024-12-02
draft: false
---

In this post, I'll walk through the process of building a personal website from scratch.

## The Tech Stack

For this project, I chose:

- **Hugo** for static site generation
- **Vanilla CSS** for styling
- **fly.io** for hosting
- **GitHub Actions** for CI/CD

## Design Philosophy

I wanted to keep things minimal and focused on content. The design principles I followed:

- Clean typography
- Fast load times
- Mobile-first responsive design
- No unnecessary JavaScript

## Deployment

The deployment pipeline is fully automated. Every push to the main branch triggers a build and deployment to fly.io.

This setup allows me to focus on writing content without worrying about infrastructure.
