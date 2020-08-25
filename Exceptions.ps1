

#deobfuscates exceptions, pass in $_
function WriteException($exception)
{
	if ($exception.GetType() -eq [System.Management.Automation.ErrorRecord])
	{
		$exception = $exception.Exception
	}
	
	Write-Host $exception.Message -ForegroundColor Magenta -NoNewline
	Write-Host " (" $exception.GetType() ")" -ForegroundColor Red 
	if ($exception.InnerException -ne $null)
	{
		WriteException $exception.InnerException
	}
	else
	{
		Write-Host ""
	}
}