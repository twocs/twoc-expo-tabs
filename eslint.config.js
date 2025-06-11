// https://docs.expo.dev/guides/using-eslint/
const { defineConfig } = require('eslint/config');
const expoConfig = require("eslint-config-expo/flat");
const eslintPluginPrettierRecommended = require('eslint-plugin-prettier/recommended');

module.exports = defineConfig([
  expoConfig,
  eslintPluginPrettierRecommended,
  {
    ignores: [
      "dist/*",
      "/.expo",
      "node_modules",
      "ios/**",
      "android/**",
      "assets/**",
      ".vscode",
      ".expo-shared"
    ],
  },
  {
    files: ["**/__tests__/**/*", "**/*.test.*", "**/*.spec.*"],
    languageOptions: {
      globals: {
        it: 'readonly',
        describe: 'readonly',
        expect: 'readonly',
        beforeEach: 'readonly',
        afterEach: 'readonly',
        beforeAll: 'readonly',
        afterAll: 'readonly',
        jest: 'readonly',
      },
    },
  },
]);
