function Test-DSCModules($Modules, [string]$ComputerName, [bool]$AutoInstall=$true)
{
	$success = $true
    $bInternetAccess = Test-NetConnection -ComputerName nuget.org -CommonTCPPort HTTP -InformationLevel Quiet -WarningAction SilentlyContinue
    
        Write-Host ("Checking for required Powershell Modules") -ForegroundColor Cyan
	
        $installedCount = 0
	
		foreach ($mod in $Modules.GetEnumerator())
		{
            Write-Host ("Checking for Module " + $mod.Name) -ForegroundColor Yellow -NoNewline

            if (!(Get-DscResource -Module $($mod.Name) 3>$null))
            {
                Write-Host "...You must manually install $($mod.Name) to proceed" -ForegroundColor Red
                $success = $false
            }
            else
            {
                Write-Host "....$($mod.Name) installed" -ForegroundColor Green
                $installed++
            }
        }
        if ($installedCount -eq $modules.Count)
        {
            return
        }
    
    if (!$bInternetAccess)
    {
		Write-Host ("This server does not have internet access, checking for required Powershell Modules") -ForegroundColor Red
        if ($AutoInstall)
        {
            foreach ($mod in $Modules.GetEnumerator())
		    {
                Write-Host ("Checking for Module " + $mod.Name) -ForegroundColor Yellow -NoNewline

                if (!(Get-DscResource -Module $($mod.Name) 3>$null))
                {
                    Write-Host "...Installing [$($mod.Name)] [$($mod.Value)] from PSGallery" -ForegroundColor "Green"

                    Install-Module $($mod.Name) -RequiredVersion $($mod.Value) -Force
                }
                else
                {
                    Write-Host "...Module found" -ForegroundColor Green
                }
		    }
        }
    }
    #return $success
}