# Reproducible Copilot skill snapshots for matlab-sciplot

This project uses a local Copilot skill (`matlab-sciplot`) that may evolve over time.
To keep plot generation reproducible, we snapshot the exact skill version used for a run.

## Why this is needed

- Local skills in `$HOME/.copilot/skills` are mutable.
- If skill instructions or helper scripts change later, regenerated figures can differ.
- A committed snapshot allows others to run with the same skill content you used.

## Canonical approach

1. Keep developing your working skill in your local profile folder.
2. Before producing a reproducible figure set, run a snapshot into this repo.
3. Commit the snapshot and reference its version in your analysis notes/commit message.
4. Continue changing your local skill freely; old snapshots stay frozen.

## Snapshot command

From the repository root:

```powershell
./Shortcuts/snapshot-copilot-skill.ps1 -SkillName matlab-sciplot
```

Optional explicit version label:

```powershell
./Shortcuts/snapshot-copilot-skill.ps1 -SkillName matlab-sciplot -Version v1.0.0
```

This writes:

- `docs/skills/snapshots/matlab-sciplot/<version>/...` (full skill copy)
- `docs/skills/snapshots/matlab-sciplot/<version>/manifest.json` (file hashes and metadata)
- `docs/skills/snapshots/matlab-sciplot/LATEST.txt` (most recent snapshot pointer)

## How collaborators use the frozen snapshot

1. Copy the desired snapshot folder into their local Copilot skills path:

```text
$HOME/.copilot/skills/matlab-sciplot
```

2. Ensure the copied folder includes both `SKILL.md` and `scripts/`.
3. Run plotting workflow using the same snapshot version referenced in the project notes.

## Recommended reproducibility note

When generating figures, record the skill version in the experiment log, for example:

```text
skill: matlab-sciplot
snapshot: docs/skills/snapshots/matlab-sciplot/v1.0.0
manifest: <snapshot>/manifest.json
```

## Optional hardening

- Create a git tag for important snapshot milestones (for example, `plots-2026-05-10`).
- Include the snapshot path in figure-generation scripts or README sections.
