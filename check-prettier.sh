#!/bin/bash
cd /Users/tomanderson/tom-andeau
npx prettier --check .
if [ $? -eq 0 ]; then
    echo "Prettier passed!"
else
    echo "Prettier failed!"
    exit 1
fi
