#!/bin/bash

# Template Validation Script
# Ensures the template is ready for distribution

set -e

echo "🔍 Validating Expo TypeScript Theme Template"
echo "============================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Validation functions
validate_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} $1 exists"
        return 0
    else
        echo -e "${RED}✗${NC} $1 missing"
        return 1
    fi
}

validate_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✓${NC} $1/ directory exists"
        return 0
    else
        echo -e "${RED}✗${NC} $1/ directory missing"
        return 1
    fi
}

validate_package_json() {
    echo "📦 Validating package.json..."
    
    # Check if package.json exists and is valid JSON
    if ! jq empty package.json 2>/dev/null; then
        echo -e "${RED}✗${NC} package.json is not valid JSON"
        return 1
    fi
    
    # Check required fields
    local name=$(jq -r .name package.json)
    local description=$(jq -r .description package.json)
    local license=$(jq -r .license package.json)
    
    if [ "$name" = "null" ] || [ "$name" = "" ]; then
        echo -e "${RED}✗${NC} package.json missing 'name' field"
        return 1
    fi
    
    if [ "$description" = "null" ] || [ "$description" = "" ]; then
        echo -e "${RED}✗${NC} package.json missing 'description' field"
        return 1
    fi
    
    if [ "$license" = "null" ] || [ "$license" = "" ]; then
        echo -e "${RED}✗${NC} package.json missing 'license' field"
        return 1
    fi
    
    echo -e "${GREEN}✓${NC} package.json is valid"
    return 0
}

validate_scripts() {
    echo "🔧 Validating npm scripts..."
    
    local scripts=("start" "test" "lint" "format" "format:check" "type-check")
    local all_valid=true
    
    for script in "${scripts[@]}"; do
        if jq -e ".scripts.\"$script\"" package.json >/dev/null; then
            echo -e "${GREEN}✓${NC} Script '$script' exists"
        else
            echo -e "${RED}✗${NC} Script '$script' missing"
            all_valid=false
        fi
    done
    
    if [ "$all_valid" = true ]; then
        return 0
    else
        return 1
    fi
}

# Main validation
main() {
    local errors=0
    
    echo "📁 Validating file structure..."
    
    # Required files
    validate_file "package.json" || ((errors++))
    validate_file "app.json" || ((errors++))
    validate_file "tsconfig.json" || ((errors++))
    validate_file "README.md" || ((errors++))
    validate_file "LICENSE" || ((errors++))
    validate_file "eslint.config.js" || ((errors++))
    validate_file "jest.setup.js" || ((errors++))
    validate_file "template.json" || ((errors++))
    
    # Required directories
    validate_dir "app" || ((errors++))
    validate_dir "components" || ((errors++))
    validate_dir "context" || ((errors++))
    validate_dir "constants" || ((errors++))
    validate_dir "assets" || ((errors++))
    
    echo ""
    
    # Validate configurations
    validate_package_json || ((errors++))
    validate_scripts || ((errors++))
    
    echo ""
    echo "============================================="
    
    if [ $errors -eq 0 ]; then
        echo -e "${GREEN}🎉 Template validation passed!${NC}"
        echo ""
        echo "Template is ready for distribution!"
        return 0
    else
        echo -e "${RED}❌ Template validation failed with $errors error(s)${NC}"
        return 1
    fi
}

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo -e "${RED}❌ Error: package.json not found. Are you in the project directory?${NC}"
    exit 1
fi

# Run validation
main