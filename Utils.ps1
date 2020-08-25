

function Test-IsPowershellInstanceAdmin()
{
    return [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
}

function Test-Files([array]$filePaths)
{
    $result = $true

    foreach($file in $filePaths)
    {
        if(-Not (Test-Path $file))
        {
            Write-Host "ERROR:Missing file: $file" -ForegroundColor Red
            $result = $false
        }
    }
    return $result
}