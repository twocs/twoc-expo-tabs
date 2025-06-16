#!/bin/bash

# Fetch LLM Documentation Script
# Downloads the latest Expo documentation files for LLM/AI assistance

set -e

echo "📚 Fetching latest Expo LLM documentation..."

# Base URL for Expo LLM documentation
EXPO_DOCS_BASE="https://docs.expo.dev"

# Array of LLM documentation files to download
LLM_DOCS=(
    "llms.txt"
    "llms-full.txt"
    "llms-eas.txt"
    "llms-sdk.txt"
)

# Function to download a file with error handling
download_file() {
    local filename=$1
    local url="${EXPO_DOCS_BASE}/${filename}"
    
    echo "  Downloading ${filename}..."
    
    if command -v curl &> /dev/null; then
        if curl -fsSL "$url" -o "$filename"; then
            echo "  ✅ Successfully downloaded ${filename}"
        else
            echo "  ⚠️  Failed to download ${filename} (file may not exist)"
        fi
    elif command -v wget &> /dev/null; then
        if wget -q "$url" -O "$filename"; then
            echo "  ✅ Successfully downloaded ${filename}"
        else
            echo "  ⚠️  Failed to download ${filename} (file may not exist)"
        fi
    else
        echo "  ❌ Error: Neither curl nor wget found. Cannot download documentation."
        exit 1
    fi
}

# Function to create template-specific documentation
create_template_docs() {
    echo "  Creating template-specific documentation..."
    
    cat > "llms-template.txt" << 'EOF'
# Expo TypeScript Theme Template Documentation

This project was created from the Expo TypeScript Theme Template, which provides a robust foundation for building cross-platform applications with Expo, React Native, and TypeScript.

## Template Features

This template includes:
- **TypeScript**: Full TypeScript configuration with strict type checking
- **Expo Router**: File-based routing for navigation
- **Theme Support**: Light/dark mode theming with context provider
- **Testing Setup**: Jest and React Native Testing Library configured
- **Linting & Formatting**: ESLint and Prettier pre-configured
- **CI/CD Ready**: GitHub Actions workflows for testing and validation
- **Component Library**: Reusable themed components
- **Safe Area Handling**: Proper safe area configuration for modern devices

## Project Structure

- `app/`: Contains the main app screens using Expo Router file-based routing
- `components/`: Reusable UI components with theme support
- `constants/`: App constants including color definitions
- `context/`: React context providers (ThemeContext)
- `assets/`: Static assets (images, fonts, icons)
- `scripts/`: Utility scripts including this documentation fetcher

## Available Scripts

- `npm start`: Start the Expo development server
- `npm test`: Run tests in watch mode
- `npm run test:ci`: Run tests in CI mode
- `npm run lint`: Check code with ESLint
- `npm run format`: Format code with Prettier
- `npm run type-check`: Run TypeScript type checking
- `./scripts/fetch-llm-docs.sh`: Update LLM documentation files

## Development Workflow

1. Start development server: `npm start`
2. Make changes to your code
3. Test changes: `npm test`
4. Lint and format: `npm run lint && npm run format`
5. Type check: `npm run type-check`

## Theme System

The template includes a comprehensive theme system with:
- Light and dark mode support
- Themed components that automatically adapt
- Context-based theme switching
- Platform-specific styling considerations

For more information about Expo development, refer to the other llms-*.txt files in this project.

---

Generated on: $(date)
EOF
    
    echo "  ✅ Created template-specific documentation"
}

# Main function
main() {
    # Check if we're in a project directory
    if [ ! -f "package.json" ]; then
        echo "❌ Error: package.json not found. Are you in the project directory?"
        exit 1
    fi
    
    echo "📍 Current directory: $(pwd)"
    echo ""
    
    # Download each LLM documentation file
    for doc in "${LLM_DOCS[@]}"; do
        download_file "$doc"
    done
    
    echo ""
    
    # Create template-specific documentation
    create_template_docs
    
    echo ""
    echo "🎉 LLM documentation fetch complete!"
    echo ""
    echo "Downloaded files:"
    for doc in "${LLM_DOCS[@]}"; do
        if [ -f "$doc" ]; then
            size=$(wc -c < "$doc" | tr -d ' ')
            echo "  📄 ${doc} (${size} bytes)"
        fi
    done
    
    if [ -f "llms-template.txt" ]; then
        size=$(wc -c < "llms-template.txt" | tr -d ' ')
        echo "  📄 llms-template.txt (${size} bytes)"
    fi
    
    echo ""
    echo "💡 These files provide comprehensive documentation for LLM/AI assistance"
    echo "   and will be preserved during template setup."
}

# Show help message
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: ./scripts/fetch-llm-docs.sh"
    echo ""
    echo "This script downloads the latest Expo LLM documentation files"
    echo "to assist AI agents working with your project."
    echo ""
    echo "Files downloaded:"
    for doc in "${LLM_DOCS[@]}"; do
        echo "  - ${doc}"
    done
    echo "  - llms-template.txt (generated locally)"
    echo ""
    echo "These files provide comprehensive Expo documentation that helps"
    echo "LLM agents understand your project structure and available APIs."
    exit 0
fi

# Run main function
main
