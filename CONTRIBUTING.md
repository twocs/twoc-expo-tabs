# Contributing to Expo TypeScript Theme Template

Thank you for your interest in contributing! This document provides guidelines for contributing to this template.

## 🚀 Getting Started

1. **Fork the repository**
2. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/expo-typescript-theme-template.git
   cd expo-typescript-theme-template
   ```
3. **Install dependencies:**
   ```bash
   npm install
   ```
4. **Start the development server:**
   ```bash
   npm start
   ```

## 🛠 Development Workflow

### Before Making Changes

1. Create a new branch: `git checkout -b feature/your-feature-name`
2. Make sure all tests pass: `npm test`
3. Ensure code is properly formatted: `npm run format:check`
4. Check for linting errors: `npm run lint`

### Making Changes

1. **Code Style**: Follow the existing code style and conventions
2. **TypeScript**: Maintain strict type safety
3. **Testing**: Add tests for new features
4. **Documentation**: Update README.md if needed

### Quality Checks

Before submitting your changes, run:

```bash
# Run all quality checks
npm run lint          # ESLint
npm run format:check  # Prettier
npm run type-check    # TypeScript
npm test              # Jest tests
```

### Commit Guidelines

Use conventional commit messages:

- `feat:` new features
- `fix:` bug fixes
- `docs:` documentation changes
- `style:` code style changes
- `refactor:` code refactoring
- `test:` adding tests
- `chore:` maintenance tasks

Example: `feat: add theme toggle animation`

## 🧪 Testing

### Running Tests

```bash
npm test              # Watch mode for development
npm run test:ci       # Single run for CI
```

### Writing Tests

- Place tests in `__tests__` directories next to components
- Use React Testing Library for component tests
- Mock external dependencies appropriately
- Aim for meaningful test descriptions

### Test Structure

```javascript
describe("ComponentName", () => {
  it("should render correctly", () => {
    // Test implementation
  });

  it("should handle user interactions", () => {
    // Test implementation
  });
});
```

## 📁 Project Structure

Understanding the template structure:

```
├── app/                    # Expo Router screens
│   ├── (tabs)/            # Tab navigation
│   ├── _layout.tsx        # Root layout with providers
│   └── modal.tsx          # Modal screens
├── components/            # Reusable UI components
│   ├── Themed.tsx         # Theme-aware components
│   └── __tests__/         # Component tests
├── context/               # React contexts
│   └── ThemeContext.tsx   # Global theme state
├── constants/             # App constants and colors
└── assets/               # Static assets
```

## 🎯 Areas for Contribution

### High Priority

- Bug fixes and stability improvements
- Performance optimizations
- Better TypeScript types
- Test coverage improvements
- Documentation updates

### Medium Priority

- New theme-aware components
- Additional utility hooks
- Example implementations
- Developer experience improvements

### Nice to Have

- Animation examples
- Additional color schemes
- Accessibility improvements
- Platform-specific optimizations

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Clear description** of the issue
2. **Steps to reproduce** the problem
3. **Expected behavior** vs actual behavior
4. **Environment details**:
   - Expo SDK version
   - React Native version
   - Platform (iOS/Android/Web)
   - Device/simulator info
5. **Code samples** or minimal reproduction
6. **Screenshots** if applicable

Use the bug report template in GitHub Issues.

## 💡 Feature Requests

For new features:

1. **Check existing issues** to avoid duplicates
2. **Describe the use case** and benefits
3. **Provide examples** of desired API/behavior
4. **Consider backwards compatibility**
5. **Discuss implementation approach**

Use the feature request template in GitHub Issues.

## 🔄 Pull Request Process

1. **Update documentation** for any new features
2. **Add tests** for new functionality
3. **Ensure all checks pass** (CI will verify)
4. **Link to related issues** in PR description
5. **Provide clear description** of changes
6. **Request review** from maintainers

### PR Checklist

- [ ] Tests pass locally
- [ ] Code follows style guidelines
- [ ] Documentation updated if needed
- [ ] TypeScript types are correct
- [ ] No breaking changes (or clearly documented)
- [ ] Related issues are linked

## 👥 Code Review

### For Reviewers

- Focus on correctness and maintainability
- Suggest improvements for readability
- Check for potential performance issues
- Verify TypeScript types are appropriate
- Ensure tests cover new functionality

### For Contributors

- Respond to feedback constructively
- Ask questions if feedback is unclear
- Make requested changes promptly
- Update tests if implementation changes

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🤝 Community

- Be respectful and inclusive
- Help others learn and grow
- Share knowledge and best practices
- Collaborate constructively

## 📞 Getting Help

If you need help:

1. Check the [README.md](README.md) documentation
2. Search existing GitHub Issues
3. Ask questions in GitHub Discussions
4. Reach out to maintainers

Thank you for contributing! 🎉
