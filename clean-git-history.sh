#!/bin/bash

# --- Configuration ---
BRANCH_NAME="main" # Change to "master" if necessary

# 1. Check if it's a git repo
if [ ! -d .git ]; then
    echo "Error: This directory is not a Git repository."
    exit 1
fi

echo "🚀 Starting fresh... This will collapse all history into 'Commit 1'."

# 2. Create an orphan branch (no history)
git checkout --orphan temp_branch

# 3. Add all current files
git add -A

# 4. Create the initial commit
git commit -m "Initial commit"

# 5. Delete the old branch locally
git branch -D $BRANCH_NAME

# 6. Rename the temporary branch to the main branch name
git branch -m $BRANCH_NAME

echo "✅ History has been cleared locally."
echo "⚠️  To update your remote (GitHub/GitLab), run: git push -f origin $BRANCH_NAME"