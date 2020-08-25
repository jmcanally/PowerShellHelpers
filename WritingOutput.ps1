

#THIS SCRIPT DEMONSTRATES DIFFERENT TYPES OF OUTPUT WITH POWERSHELL

# ========= WRITE-OUTPUT ===============
# This can be used to show only debug messages to the user as opposed to verbose messages or warning messages
Write-Output "Start `Write-Output example"
Write-Output "This is a sample message that shows up in the host application or pipeline. Message using `Write-Host will not show up here"
Write-Output "End `Write-Output example"
# ========= END WRITE-DEBUG ===============

Write-Output ""
Write-Output "---------------------------------------"
Write-Output ""

# ========= WRITE-DEBUG ===============
# This can be used to show only debug messages to the user as opposed to verbose messages or warning messages
	Write-Output "Start `Write-Debug example"
	Write-Debug "This is a debug message that will no show up"
	$DebugPreference = "Continue"
	Write-Debug "This is a debug message, this will only show up when the `$DebugPreference=Continue"
	Write-Output "End`Write-Debug example"
# ========= END WRITE-DEBUG ===============

Write-Output ""
Write-Output "---------------------------------------"
Write-Output ""

# ========= WRITE-ERROR ===============
# This can be used to show error message in red with the line number and character number
	Write-Output "Start `Write-Error example"
	Write-Error "This is an error message using the `Write-Error command"
	Write-Output "End`Write-Error example"
# ========= END WRITE-ERROR ===============


Write-Output ""
Write-Output "---------------------------------------"
Write-Output ""


# ========= WRITE-PROGRESS ===============
# This can be used in a long running script to show progress to the user
	Write-Output "Start `Write-Progress example"
	for ($a=1; $a -lt 10; $a++) {
	  Write-Progress -Activity "Working..." -PercentComplete $a -CurrentOperation "$a% complete" -Status "Please wait."
	  Start-Sleep 1
	}
	Write-Progress -Activity "Working..." -Completed -Status "All done."
	Write-Output "End`Write-Progress example"
# ========= END WRITE-PROGRESS ===============


Write-Output ""
Write-Output "---------------------------------------"
Write-Output ""


# ========= WRITE-VERBOSE ===============
# This can be used to show only verbose messages to the user as opposed to debug messages or warning messages, user must change the `$VerbosePreference variable to see this message
	Write-Output "Start `Write-Verbose example"
	Write-Verbose "This is the 1st verbose message, the variable `$VerbosePreference is currently set to $VerbosePreference"
	$VerbosePreference = "Continue"
	Write-Verbose "This is the 2nd verbose message, this only shows up when the `$VerbosePreference variable is set to Continue"
	$VerbosePreference = "SilentlyContinue"
	Write-Output "End`Write-Verbose example"
# ========= END WRITE-VERBOSE ===============


Write-Output ""
Write-Output "---------------------------------------"
Write-Output ""


# ====== WRITE-WARNING ========
# This is a quick and simple way to write a message to the user in Yellow font color, this message does not require any environment varaibles to be changed to appear to the user
	Write-Output "Start `Write-Warning example"
	Write-Warning "This is a yellow warning message"
	Write-Output "End`Write-Warning example"

