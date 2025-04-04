#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo --gc --cleanDestinationDir --minify # if using a theme, replace with `hugo -t <YOURTHEME>`

\cp -p -f -R public/* docs
git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ $# -eq 1 ]; then
    msg="$1"
fi
git commit -S -m "$msg"

# Push source and build repos.
git push origin main
