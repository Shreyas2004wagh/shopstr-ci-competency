$baseline = [ordered]@{
  "utils/nostr/nostr-helper-functions.ts" = [ordered]@{
    Statements = "13.97%"
    Branches   = "14.79%"
    Functions  = "10.97%"
    Lines      = "14.46%"
  }
  "utils/nostr/fetch-service.ts" = [ordered]@{
    Statements = "7.54%"
    Branches   = "4.56%"
    Functions  = "3.52%"
    Lines      = "7.69%"
  }
}

foreach ($module in $baseline.Keys) {
  Write-Host $module
  $metrics = $baseline[$module]
  foreach ($name in $metrics.Keys) {
    Write-Host ("  {0}: {1}" -f $name, $metrics[$name])
  }
  Write-Host ""
}
