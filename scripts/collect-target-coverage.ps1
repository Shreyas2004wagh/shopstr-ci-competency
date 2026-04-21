param(
  [string]$ShopstrRepoPath = "..\\shopstr"
)

$resolvedRepo = Resolve-Path $ShopstrRepoPath

Write-Host "Using Shopstr repository at: $resolvedRepo"

$command = @(
  "npx jest",
  "utils/nostr/__tests__/local-storage-data.test.ts",
  "utils/nostr/__tests__/fetch-service.test.ts",
  "--coverage",
  "--runInBand",
  "--collectCoverageFrom=utils/nostr/nostr-helper-functions.ts",
  "--collectCoverageFrom=utils/nostr/fetch-service.ts",
  "--coverageReporters=text-summary",
  "--coverageReporters=json-summary"
) -join " "

Write-Host "Running targeted coverage command..."
Write-Host $command

Push-Location $resolvedRepo
try {
  Invoke-Expression $command
} finally {
  Pop-Location
}
