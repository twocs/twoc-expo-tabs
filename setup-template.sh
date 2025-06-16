#!/bin/bash

# Template Setup Script
# This script helps initialize a new project from the template

set -e

PROJECT_NAME=${1:-"MyExpoApp"}

echo "🚀 Setting up Expo TypeScript Theme Template"
echo "Project name: $PROJECT_NAME"

# Function to update package.json with new project name
update_package_json() {
    echo "📝 Updating package.json..."
    if command -v jq &> /dev/null; then
        # Use jq if available for proper JSON manipulation
        jq --arg name "$PROJECT_NAME" '.name = $name | del(.repository) | del(.bugs) | del(.homepage)' package.json > package.json.tmp && mv package.json.tmp package.json
    else
        # Fallback to sed (less reliable but more widely available)
        sed -i.bak "s/\"expo-typescript-theme-template\"/\"$PROJECT_NAME\"/g" package.json
        rm -f package.json.bak
    fi
}

# Function to update app.json with new project name
update_app_json() {
    echo "📱 Updating app.json..."
    if command -v jq &> /dev/null; then
        jq --arg name "$PROJECT_NAME" '.expo.name = $name | .expo.slug = ($name | ascii_downcase)' app.json > app.json.tmp && mv app.json.tmp app.json
    else
        # Fallback for app.json
        sed -i.bak "s/\"andeau\"/\"$PROJECT_NAME\"/g" app.json
        rm -f app.json.bak
    fi
}

# Function to fetch LLM documentation
fetch_llm_docs() {
    echo "📚 Fetching latest Expo LLM documentation..."
    
    if [ -f "scripts/fetch-llm-docs.sh" ]; then
        ./scripts/fetch-llm-docs.sh
    else
        echo "⚠️  Warning: fetch-llm-docs.sh script not found. Skipping LLM documentation fetch."
    fi
}

# Function to clean up template-specific files
cleanup_template_files() {
    echo "🧹 Cleaning up template files..."
    
    # Remove template-specific files
    rm -f check-prettier.sh
    rm -f template.json
    rm -f setup-template.sh
    
    # Remove .history if it exists
    rm -rf .history
    
    echo "✅ Template files cleaned up"
}

# Function to install dependencies
install_dependencies() {
    echo "📦 Installing dependencies..."
    
    if command -v npm &> /dev/null; then
        npm install
    elif command -v yarn &> /dev/null; then
        yarn install
    else
        echo "❌ No package manager found. Please install npm or yarn."
        exit 1
    fi
    
    echo "✅ Dependencies installed"
}

# Function to initialize git repository
init_git() {
    echo "🔧 Initializing git repository..."
    
    if [ -d ".git" ]; then
        echo "📁 Git repository already exists"
    else
        git init
        git add .
        git commit -m "Initial commit from Expo TypeScript Theme Template"
        echo "✅ Git repository initialized"
    fi
}

# Function to run initial tests
run_tests() {
    echo "🧪 Running initial tests..."
    
    npm run test:ci
    npm run lint
    npm run type-check
    
    echo "✅ All tests passed"
}

# Main setup process
main() {
    echo ""
    echo "Starting template setup..."
    echo ""
    
    # Check if we're in the right directory
    if [ ! -f "package.json" ]; then
        echo "❌ Error: package.json not found. Are you in the project directory?"
        exit 1
    fi
    
    # Update project configuration
    update_package_json
    update_app_json
    
    # Fetch latest LLM documentation
    fetch_llm_docs
    
    # Clean up template files
    cleanup_template_files
    
    # Install dependencies
    install_dependencies
    
    # Initialize git repository
    init_git
    
    # Run tests to ensure everything works
    run_tests
    
    echo ""
    echo "🎉 Template setup complete!"
    echo ""
    echo "📚 Note: Latest Expo documentation has been downloaded for AI/LLM assistance."
    echo "   Use './scripts/fetch-llm-docs.sh' to update documentation anytime."
    echo ""
    echo "Next steps:"
    echo "1. Start the development server: npm start"
    echo "2. Open the Expo Go app and scan the QR code"
    echo "3. Start building your amazing app!"
    echo ""
    echo "Available commands:"
    echo "  npm start         - Start Expo development server"
    echo "  npm test          - Run tests in watch mode"
    echo "  npm run lint      - Check code with ESLint"
    echo "  npm run format    - Format code with Prettier"
    echo ""
    echo "Happy coding! 🚀"
}

# Show help message
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: ./setup-template.sh [PROJECT_NAME]"
    echo ""
    echo "This script sets up a new project from the Expo TypeScript Theme Template."
    echo ""
    echo "Arguments:"
    echo "  PROJECT_NAME    Name for your new project (default: MyExpoApp)"
    echo ""
    echo "Example:"
    echo "  ./setup-template.sh MyAwesomeApp"
    exit 0
fi

# Run main setup
main
