# GitHub Pages Deployment for Flutter Web

## Overview

Research on deploying Flutter web applications to GitHub Pages with CI/CD automation using GitHub Actions.

## Deployment Status

- **Maturity**: GitHub Actions deployment left beta phase in 2022, now production-ready
- **Method**: Changed from "Deploy from a branch" to "GitHub Actions" in repository Pages settings
- **Compatibility**: Fully supports Flutter web applications

**Source:**
- [GitHub Actions to deploy Flutter Web to gh-pages](https://www.immadisairaj.dev/blog/2022/github-actions-for-flutter-web/)

## GitHub Actions Setup

### Available Actions & Tools

1. **bluefireteam/flutter-gh-pages**
   - Automates build and deployment of Flutter web apps
   - Requires GITHUB_TOKEN with write permissions
   - **Source**: [flutter-gh-pages GitHub](https://github.com/bluefireteam/flutter-gh-pages)

2. **peaceiris/actions-gh-pages**
   - Popular action for publishing to gh-pages branch
   - Used in deploy jobs after build completes
   - **Sources**:
     - [Flutter Web and CD to GitHub Pages](https://medium.com/@kinneko-de/flutter-web-and-cd-to-github-pages-9f72d37bc949)
     - [Flutter Web — Github Actions-Github Pages](https://medium.com/flutter-community/flutter-web-github-actions-github-pages-dec8f308542a)

3. **Marketplace Action**
   - Deploy Flutter web app to GitHub Pages (removing large assets/NOTICES file)
   - Optimized for Flutter web
   - **Source**: [GitHub Marketplace Action](https://github.com/marketplace/actions/deploy-flutter-web-app-to-github-pages-removing-large-assets-notices-file)

### Typical Workflow Structure

```yaml
# Common approach
jobs:
  build:
    - Checkout code
    - Setup Flutter
    - Get dependencies
    - Run flutter build web --release
    - Upload artifacts

  deploy:
    - Download artifacts
    - Deploy to gh-pages using peaceiris/actions-gh-pages
```

**Sources:**
- [Flutter CI/CD using GitHub Actions - LogRocket](https://blog.logrocket.com/flutter-ci-cd-using-github-actions/)
- [Flutter CI/CD Using GitHub Actions — Android & Web Deployment](https://medium.com/@punithsuppar7795/flutter-ci-cd-using-github-actions-android-web-deployment-from-zero-to-release-db47d7776cd4)
- [Deploy Flutter web app with GitHub Actions on Pages in 5 min](https://igorsteblii.medium.com/deploy-flutter-web-app-with-github-actions-or-gitlab-ci-cd-on-pages-in-5-min-6a473ac79101)

## Build Configuration

### Flutter Web Build Command
```bash
flutter build web --release
```

### Optimization Considerations
- Remove large NOTICES file (reduces build size)
- Optimize assets
- Configure base href for subdirectory hosting if needed
- Consider web renderers (HTML vs CanvasKit)

## Repository Configuration

### Pages Settings
1. Navigate to repository Settings > Pages
2. Change source from "Deploy from a branch" to "GitHub Actions"
3. Configure custom domain if needed

### Permissions
- GITHUB_TOKEN needs write permissions
- Configure in workflow file or repository settings

## CI/CD Pipeline Benefits

- **Automatic Deployment**: Every push triggers build and deploy
- **Preview Builds**: Can create preview environments for PRs
- **Consistency**: Same build process every time
- **Fast Feedback**: Automated testing before deployment

## Implementation Steps

1. Create `.github/workflows/deploy.yml` in repository
2. Configure build job with Flutter setup
3. Add deploy job with gh-pages action
4. Set GitHub Pages source to GitHub Actions
5. Push to trigger first deployment

## Performance Considerations

- **Build Time**: ~2-5 minutes for typical Flutter web app
- **CDN**: GitHub Pages uses CDN for fast delivery
- **Caching**: Configure dependency caching to speed up builds
- **Asset Optimization**: Compress images, minimize bundle size

## Subdirectory Hosting

If hosting at `username.github.io/project-name/`:
- Configure base href: `<base href="/project-name/">`
- Update asset paths accordingly

## Recommended Workflow

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

permissions:
  contents: write

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
          channel: 'stable'

      - name: Install dependencies
        run: flutter pub get

      - name: Build web
        run: flutter build web --release --base-href "/ios_design_system/"

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

## Conclusion

GitHub Pages deployment for Flutter web is mature, well-documented, and straightforward to implement with GitHub Actions. The ecosystem provides multiple ready-to-use actions that handle the complexity of deployment automatically.
