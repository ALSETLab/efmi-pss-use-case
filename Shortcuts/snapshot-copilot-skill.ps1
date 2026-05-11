param(
    [Parameter(Mandatory = $true)]
    [string]$SkillName,

    [string]$SourceRoot = "$HOME/.copilot/skills",
    [string]$DestRoot = "docs/skills/snapshots",

    # Use explicit version (for example: v1.0.0), or leave empty for timestamp.
    [string]$Version = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($Version)) {
    $Version = Get-Date -Format "yyyyMMdd-HHmmss"
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot

$sourceSkillPath = Join-Path $SourceRoot $SkillName
if (-not (Test-Path $sourceSkillPath)) {
    throw "Skill not found: $sourceSkillPath"
}

$skillRoot = Join-Path $DestRoot $SkillName
$destSkillPath = Join-Path $skillRoot $Version

if (Test-Path $destSkillPath) {
    throw "Destination already exists: $destSkillPath"
}

New-Item -ItemType Directory -Force -Path $destSkillPath | Out-Null
Copy-Item -Path (Join-Path $sourceSkillPath "*") -Destination $destSkillPath -Recurse -Force

$gitCommit = $null
try {
    $gitCommit = (git rev-parse HEAD).Trim()
} catch {
    $gitCommit = $null
}

$files = Get-ChildItem -Path $destSkillPath -Recurse -File | Sort-Object FullName
$fileHashes = @()
foreach ($f in $files) {
    $hash = Get-FileHash -Path $f.FullName -Algorithm SHA256
    $relative = $f.FullName.Substring((Resolve-Path $destSkillPath).Path.Length).TrimStart('\','/')
    $fileHashes += [pscustomobject]@{
        path = $relative.Replace('\\', '/')
        sha256 = $hash.Hash.ToLowerInvariant()
    }
}

$manifest = [pscustomobject]@{
    skillName = $SkillName
    version = $Version
    sourcePath = (Resolve-Path $sourceSkillPath).Path
    snapshotUtc = (Get-Date).ToUniversalTime().ToString("o")
    repositoryCommit = $gitCommit
    files = $fileHashes
}

$manifestPath = Join-Path $destSkillPath "manifest.json"
$manifest | ConvertTo-Json -Depth 10 | Set-Content -Path $manifestPath -Encoding UTF8

$latestPath = Join-Path $skillRoot "LATEST.txt"
New-Item -ItemType Directory -Force -Path $skillRoot | Out-Null
Set-Content -Path $latestPath -Value $Version -Encoding UTF8

Write-Host "Snapshot created: $destSkillPath"
Write-Host "Manifest: $manifestPath"
Write-Host "LATEST pointer: $latestPath"

$destForMessage = $destSkillPath.Replace('\', '/')
$manifestForMessage = $manifestPath.Replace('\', '/')
$commitSnippet = "[repro-skill] $SkillName snapshot=$destForMessage manifest=$manifestForMessage"
Write-Host "Commit snippet:"
Write-Host $commitSnippet
