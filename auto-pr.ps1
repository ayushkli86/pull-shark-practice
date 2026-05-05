# Human-like PR automation for Pull Shark Gold

$messages = @(
  "fix typo",
  "update docs",
  "add note",
  "clean up",
  "improve formatting",
  "fix spacing",
  "update progress",
  "add entry",
  "minor fix",
  "update list",
  "add checkpoint",
  "fix markdown",
  "update tracker",
  "add milestone",
  "clean formatting"
)

$changes = @(
  "- Progress update",
  "- Added checkpoint",
  "- Fixed formatting",
  "- Updated notes",
  "- Minor improvement",
  "- Cleaned up text",
  "- Added entry",
  "- Fixed typo",
  "- Updated tracker",
  "- Added milestone"
)

function Random-Delay {
  $seconds = Get-Random -Minimum 30 -Maximum 180
  Write-Host "Waiting $seconds seconds (human-like delay)..."
  Start-Sleep -Seconds $seconds
}

function Get-RandomMessage {
  return $messages | Get-Random
}

function Get-RandomChange {
  return $changes | Get-Random
}

# Number of PRs to create (default 5, max 10 per run)
$count = 5

for ($i = 1; $i -le $count; $i++) {
  $branch = "update-$(Get-Date -Format 'yyyyMMdd')-$i"
  $msg = Get-RandomMessage
  $change = Get-RandomChange
  
  Write-Host "`nCreating PR $i/$count..." -ForegroundColor Green
  
  git checkout main
  git pull origin main
  git checkout -b $branch
  
  Add-Content -Path "practice.md" -Value "`n$change"
  
  git add practice.md
  git commit -m $msg
  git push origin $branch
  
  gh pr create --title $msg --body "Small update to practice file" --base main --head $branch
  
  Random-Delay
  
  gh pr merge $branch --squash --delete-branch
  
  Write-Host "PR $i/$count completed" -ForegroundColor Cyan
  Random-Delay
}

Write-Host "`nDone! Created $count PRs" -ForegroundColor Green
