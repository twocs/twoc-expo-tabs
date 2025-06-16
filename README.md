# Expo Router + TypeScript + Dark/Light Theme Template

A modern Expo template with TypeScript, theme management, and comprehensive development tooling.

## 🚀 Features

- **Expo Router** - File-based routing for React Native
- **TypeScript** - Full type safety
- **Theme Management** - Global dark/light theme with persistence
- **Comprehensive Tooling** - ESLint, Prettier, Jest, cSpell
- **Testing Setup** - React Testing Library with mocks
- **Three Tab Layout** - Customizable tab navigation

## 🛠 Tech Stack

- [Expo](https://expo.dev/) ~53.0
- [React Native](https://reactnative.dev/) 0.79
- [TypeScript](https://www.typescriptlang.org/)
- [Expo Router](https://docs.expo.dev/router/introduction/) ~5.1
- [AsyncStorage](https://react-native-async-storage.github.io/async-storage/) for theme persistence
- [React Testing Library](https://callstack.github.io/react-native-testing-library/)

## 📱 What's Included

### Theme System

- Global theme context with dark/light modes
- Persistent theme storage using AsyncStorage
- Theme toggle component in the Experimental tab
- All components use the global theme

### Development Tools

- **ESLint** with Expo and TypeScript rules
- **Prettier** for code formatting
- **Jest** with React Testing Library setup
- **cSpell** for spell checking with HTML entity support
- **TypeScript** strict mode configuration

### App Structure

- **Tab One**: Home screen with placeholder content
- **Tab Two**: Secondary screen with placeholder content
- **Experimental**: Theme toggle and experimental features
- **Modal**: Example modal implementation
- **Not Found**: 404 error page

## 🚀 Getting Started

### Prerequisites

- Node.js 18+
- npm or yarn
- Expo CLI (`npm install -g @expo/cli`)

### Installation

1. **Create a new project using this template:**

   ```bash
   npx create-expo-app MyApp --template https://github.com/twocs/expo-typescript-theme-template
   ```

2. **Install dependencies:**

   ```bash
   cd MyApp
   npm install
   ```

3. **Start the development server:**

   ```bash
   npm start
   ```

4. **Run on your device:**
   - Install the Expo Go app
   - Scan the QR code from the terminal

## 📁 Project Structure

```
├── app/                    # App screens (Expo Router)
│   ├── (tabs)/            # Tab navigation screens
│   │   ├── _layout.tsx    # Tab layout configuration
│   │   ├── index.tsx      # Tab One (Home)
│   │   ├── two.tsx        # Tab Two
│   │   └── experimental.tsx # Theme toggle tab
│   ├── _layout.tsx        # Root layout with theme provider
│   ├── modal.tsx          # Example modal
│   └── +not-found.tsx     # 404 page
├── components/            # Reusable components
│   ├── Themed.tsx         # Theme-aware components
│   ├── StyledText.tsx     # Custom text components
│   └── __tests__/         # Component tests
├── context/               # React contexts
│   └── ThemeContext.tsx   # Global theme management
├── constants/             # App constants
│   └── Colors.ts          # Theme color definitions
└── assets/               # Static assets
```

## 🎨 Customization

### Adding New Screens

1. Create a new file in the `app/` directory
2. Export a React component as default
3. The file-based routing will automatically create the route

### Modifying Theme Colors

Edit `constants/Colors.ts` to customize the light and dark theme colors:

```typescript
export default {
  light: {
    text: "#000",
    background: "#fff",
    tint: "#2f95dc",
    // ... other colors
  },
  dark: {
    text: "#fff",
    background: "#000",
    tint: "#fff",
    // ... other colors
  },
};
```

### Adding New Components

1. Create components in the `components/` directory
2. Use the `useTheme()` hook for theme-aware styling
3. Export from `components/Themed.tsx` for consistency

## 🧪 Testing

Run tests with:

```bash
npm test              # Watch mode
npm run test:ci       # CI mode
```

The template includes:

- Jest configuration with Expo preset
- React Testing Library setup
- AsyncStorage mocking
- Theme context mocking for stable tests

## 🔧 Development Scripts

```bash
npm start             # Start Expo development server
npm run android       # Open on Android device/emulator
npm run ios           # Open on iOS device/simulator
npm run web           # Open in web browser

npm test              # Run tests in watch mode
npm run test:ci       # Run tests once (CI)

npm run lint          # Check code with ESLint
npm run lint:fix      # Fix ESLint errors automatically
npm run format        # Format code with Prettier
npm run format:check  # Check if code is formatted
npm run type-check    # Check TypeScript types

npm run clean         # Clean Expo and node_modules cache
npm run update-docs   # Update LLM documentation files
```

## 🤖 AI/LLM Integration

This template includes built-in support for AI/LLM agents through comprehensive documentation files:

### Automatic Documentation

When you set up a new project, the template automatically downloads the latest Expo documentation:

- `llms.txt` - Overview and links to all Expo documentation
- `llms-full.txt` - Complete Expo documentation (1.4MB+)
- `llms-eas.txt` - Expo Application Services documentation
- `llms-sdk.txt` - Expo SDK documentation
- `llms-template.txt` - This template's specific documentation

### Updating Documentation

```bash
npm run update-docs        # Update all LLM documentation files
./scripts/fetch-llm-docs.sh # Direct script execution
```

### Benefits for AI Agents

- **Always Up-to-Date**: Documentation is fetched from Expo's official sources
- **Comprehensive Context**: Full API references and best practices
- **Template-Specific**: Includes information about this template's structure
- **Zero Maintenance**: Automatically handled during project setup

The documentation files are ignored by git (see `.gitignore`) and fetched dynamically, ensuring your template stays lean while providing rich context for AI assistance.

## 📝 Configuration Files

- **ESLint**: `eslint.config.js` - TypeScript and React Native rules
- **Prettier**: `.prettierrc` - Code formatting configuration
- **Jest**: `jest.setup.js` - Test environment setup
- **cSpell**: `.cspell.json` - Spell checking configuration
- **TypeScript**: `tsconfig.json` - Type checking configuration

## 🚀 Deployment

### Expo Application Services (EAS)

1. Install EAS CLI: `npm install -g eas-cli`
2. Configure: `eas build:configure`
3. Build: `eas build --platform all`
4. Submit: `eas submit --platform all`

### Development Build

```bash
# Create development build
eas build --profile development --platform all

# Run on development build
npm run start:dev-client
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Run tests: `npm test`
5. Run linting: `npm run lint`
6. Commit changes: `git commit -m 'Add feature'`
7. Push to branch: `git push origin feature-name`
8. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Expo Team](https://expo.dev/) for the amazing platform
- [React Native Community](https://reactnative.dev/) for the ecosystem
- [Callstack](https://callstack.com/) for React Testing Library

## 🔗 Links

- [Expo Documentation](https://docs.expo.dev/)
- [Expo Router Documentation](https://docs.expo.dev/router/introduction/)
- [React Native Documentation](https://reactnative.dev/docs/getting-started)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)
