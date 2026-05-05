#!/bin/bash

# Human-like commit messages
messages=(
  "fix typo"
  "update docs"
  "add note"
  "clean up"
  "improve formatting"
  "fix spacing"
  "update progress"
  "add entry"
  "minor fix"
  "update list"
  "add checkpoint"
  "fix markdown"
  "update tracker"
  "add milestone"
  "clean formatting"
  "fix indent"
  "update notes"
  "add comment"
  "improve readability"
  "fix alignment"
)

# Human-like changes
changes=(
  "- Progress update"
  "- Added checkpoint"
  "- Fixed formatting"
  "- Updated notes"
  "- Minor improvement"
  "- Cleaned up text"
  "- Added entry"
  "- Fixed typo"
  "- Updated tracker"
  "- Added milestone"
)

# Random delay between 30-180 seconds (human typing speed)
random_delay() {
  sleep $((30 + RANDOM % 150))
}

# Get random message
get_message() {
  echo "${messages[$RANDOM % ${#messages[@]}]}"
}

# Get random change
get_change() {
  echo "${changes[$RANDOM % ${#changes[@]}]}"
}

# Main loop
for i in {1..5}; do
  branch="update-$(date +%Y%m%d)-$i"
  msg=$(get_message)
  change=$(get_change)
  
  echo "Creating PR $i/5..."
  
  git checkout main
  git pull origin main
  git checkout -b "$branch"
  
  echo "" >> practice.md
  echo "$change" >> practice.md
  
  git add practice.md
  git commit -m "$msg"
  git push origin "$branch"
  
  gh pr create --title "$msg" --body "Small update to practice file" --base main --head "$branch"
  
  random_delay
  
  gh pr merge "$branch" --squash --delete-branch
  
  echo "PR $i/5 completed"
  random_delay
done

echo "Done! Created 5 PRs"
