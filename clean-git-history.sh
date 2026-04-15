#!/bin/bash

# --- Configuration ---
BRANCH_NAME="main"

# 1. Check if it's a git repo
if [ ! -d .git ]; then
    echo "Error: This directory is not a Git repository."
    exit 1
fi

echo "Starting fresh... This will collapse all history into 'Commit 1'."
sleep 4

# 2. Create an orphan branch (no history)
git checkout --orphan temp_branch

# 3. Add all current files
git add -A

# 4. Create the initial commit with an explanatory paragraph
# This message explains the intent: removing sensitive data and cleaning the footprint.
git commit -m "clear repository history

Hey, you might be wondering why the history only goes back to this commit. 

I decided to wipe the slate clean to keep things lean and secure. Git repos 
eventually get weighed down by old sensitive files, accidental secrets, or 
massive assets (so-called orphaned files) that are just gathering dust in 
the background.

By flattening the history, we get a much smaller repo size and peace of mind 
knowing there's no 'ghosts' hiding in the past commits."

# 5. Delete the old branch locally
git branch -D $BRANCH_NAME

# 6. Rename the temporary branch to the main branch name
git branch -m $BRANCH_NAME

echo "History has been cleared locally."
echo "To update your remote, run:"
echo "    git push --force origin $BRANCH_NAME"
