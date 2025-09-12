<#
    App properties to App.json
#>
foreach ($file in (Get-ChildItem -Path . -Recurse -Filter "App.json")) {
    $Json = Get-Content -Path $file.FullName | ConvertFrom-Json
    $Json.PackageInformation | Add-Member -MemberType "NoteProperty" -Name "PreviousVersion" -Value "1.0"
<#     $Json.Information | Add-Member -MemberType "NoteProperty" -Name "PSPackageFactoryGuid" -Value $((New-Guid).Guid)
    $Json | Add-Member -MemberType "NoteProperty" -Name "Dependencies" -Value @()
    $Json | Add-Member -MemberType "NoteProperty" -Name "Supersedence" -Value @()
    $Json | Add-Member -MemberType "NoteProperty" -Name "Assignments" -Value @() #>
    $Json | ConvertTo-Json | Out-File -Path $file.FullName -Encoding "Utf8"
}
