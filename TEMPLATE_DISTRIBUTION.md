# Template Distribution Guide

This guide explains how to distribute your Expo TypeScript Theme Template.

## 📋 Pre-Distribution Checklist

Run the validation script to ensure everything is ready:

```bash
./scripts/validate.sh
```

## 🚀 Distribution Methods

### Method 1: GitHub Template Repository

1. **Create a new repository on GitHub:**

   - Go to GitHub and create a new repository
   - Name it `expo-typescript-theme-template`
   - Check "Template repository" option
   - Add description: "Expo Router + TypeScript template with dark/light theme management"

2. **Push your code:**

   ```bash
   git init
   git add .
   git commit -m "Initial template release"
   git branch -M main
   git remote add origin https://github.com/twocs/expo-typescript-theme-template.git
   git push -u origin main
   ```

3. **Test the template:**
   ```bash
   npx create-expo-app MyTestApp --template https://github.com/twocs/expo-typescript-theme-template
   ```

### Method 2: NPM Package

1. **Update package.json:**

   ```json
   {
     "name": "@your-username/expo-typescript-theme-template",
     "keywords": ["expo-template", "expo", "typescript", "theme"],
     "files": [
       "app",
       "assets",
       "components",
       "constants",
       "context",
       "*.json",
       "*.js",
       "*.ts",
       "*.md",
       "LICENSE"
     ]
   }
   ```

2. **Publish to NPM:**

   ```bash
   npm login
   npm publish --access public
   ```

3. **Test the npm template:**
   ```bash
   npx create-expo-app MyTestApp --template @your-username/expo-typescript-theme-template
   ```

### Method 3: Local Template

For local development/testing:

```bash
npx create-expo-app MyTestApp --template ./path/to/template
```

## 🧪 Testing Your Template

After distribution, test the template thoroughly:

1. **Create a new project:**

   ```bash
   npx create-expo-app TestApp --template YOUR_TEMPLATE_SOURCE
   cd TestApp
   ```

2. **Verify setup:**

   ```bash
   npm install
   npm start
   npm test
   npm run lint
   npm run format:check
   npm run type-check
   ```

3. **Test theme functionality:**
   - Open the app
   - Navigate to Experimental tab
   - Toggle theme and verify persistence
   - Test on multiple platforms

## 📝 Template Usage Instructions

Once distributed, users can create new projects with:

```bash
# From GitHub template
npx create-expo-app MyApp --template https://github.com/twocs/expo-typescript-theme-template

# From NPM package
npx create-expo-app MyApp --template @your-username/expo-typescript-theme-template

# Then initialize
cd MyApp
./setup-template.sh MyApp
npm start
```

## 🔄 Maintenance

### Updating Dependencies

```bash
npx expo install --fix
npm audit fix
npm update
```

### Versioning

Follow semantic versioning:

- **Major**: Breaking changes
- **Minor**: New features
- **Patch**: Bug fixes

### Release Process

1. Update version in package.json
2. Update CHANGELOG.md
3. Create GitHub release
4. Update NPM package (if applicable)

## 📊 Template Analytics

Track template usage:

- GitHub template uses (visible in GitHub insights)
- NPM download statistics
- GitHub stars and forks
- Community feedback and issues

## 🤝 Community

- Encourage contributions via CONTRIBUTING.md
- Respond to issues promptly
- Accept pull requests for improvements
- Maintain documentation

## 🎯 Success Metrics

Your template is successful when:

- ✅ Easy to use and understand
- ✅ Well documented
- ✅ Actively maintained
- ✅ Community adoption
- ✅ Positive feedback
- ✅ Regular updates

Happy templating! 🚀
