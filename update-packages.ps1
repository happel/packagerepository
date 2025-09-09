# Read configuration from JSON
$configurations = Get-Content -Path "packages.json" | ConvertFrom-Json

foreach ($config in $configurations) {
    $params = @{
        Path = $config.Path
        Application = $config.Application
        Type = $config.Type
        WorkingPath = $config.WorkingPath
        Import = $config.Import
    }
    
    Write-Host "Processing applications: $($config.Application -join ', ')" -ForegroundColor Green
    
    try {
        .\New-Win32Package.ps1 @params
        Write-Host "Successfully processed: $($config.Application -join ', ')" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to process $($config.Application -join ', '): $($_.Exception.Message)"
    }
    
    Write-Host "---" -ForegroundColor Yellow
}