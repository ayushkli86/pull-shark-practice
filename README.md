# Pull Shark Practice Repository

Practice repo for earning **Pull Shark Gold** achievement (128 merged PRs).

## How to Use

1. Fork this repository
2. Make small changes to `practice.md`
3. Create a pull request
4. Merge your PR
5. Repeat 128 times for Gold tier

## Quick Method

### One-Shot Gold Rush (128 PRs)
Run the complete automation in one go:

```powershell
cd pull-shark-practice
.\gold-rush.ps1
```

**Time**: 3-6 hours with human-like delays
**Features**:
- 128 PRs automatically created and merged
- Random commit messages (30+ variations)
- Random delays (2-5 sec per PR, 30-90 sec breaks every 10 PRs)
- Progress tracking with milestones
- Natural human patterns

### Manual (Most Natural)
Edit `practice.md` directly on GitHub:
- Click the file → Edit → Commit to new branch → Create PR → Merge

### Semi-Automated (Human-like)
Use the provided scripts with random delays and varied commit messages:

**Windows:**
```powershell
cd pull-shark-practice
.\auto-pr.ps1
```

**Linux/Mac:**
```bash
cd pull-shark-practice
chmod +x auto-pr.sh
./auto-pr.sh
```

Features:
- Random commit messages (15+ variations)
- Random delays (30-180 seconds between PRs)
- Varied content changes
- Natural human patterns

## Progress Tracker

Track your merged PRs:
```bash
gh pr list --repo ayushkli86/pull-shark-practice --state merged
```

## Achievement Tiers

- Bronze: 2 merged PRs
- Silver: 16 merged PRs  
- **Gold: 128 merged PRs** ⭐
- Platinum: 1024 merged PRs

## Tips

- Keep changes small and focused
- Use descriptive commit messages
- Delete branches after merging
- Be consistent - do a few PRs daily

## Related

Part of [GitHub Achievements Guide](https://github.com/ayushkli86/github-achievements-guide)
