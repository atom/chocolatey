function Install-ChocolateyShortcut {
	param(
	  [string] $shortcutFilePath,
	  [string] $targetPath,
	  [string] $workingDirectory,
	  [string] $arguments,
	  [string] $iconLocation,
	  [string] $description
	)

	Write-Debug "Running 'Install-ChocolateyShortcut' with parameters ShortcutFilePath: `'$shortcutFilePath`', TargetPath: `'$targetPath`', WorkingDirectory: `'$workingDirectory`', Arguments: `'$arguments`', IconLocation: `'$iconLocation`', Description: `'$description`'";

	if(!$shortcutFilePath) {
		Write-ChocolateyFailure "Install-ChocolateyShortcut" "Missing ShortCutFilePath input parameter."
		return
	}

	if(!$targetPath) {
		Write-ChocolateyFailure "Install-ChocolateyShortcut" "Missing TargetPath input parameter."
		return
	}

	if(!(Test-Path($targetPath))) {
		Write-ChocolateyFailure "Install-ChocolateyShortcut" "TargetPath does not exist, so can't create shortcut."
		return
	}

	if($iconLocation) {
		if(!(Test-Path($iconLocation))) {
			Write-ChocolateyFailure "Install-ChocolateyShortcut" "IconLocation does not exist, so can't create shortcut."
			return
		}
	}

	if($workingDirectory) {
		if(!(Test-Path($workingDirectory))) {
			Write-ChocolateyFailure "Install-ChocolateyShortcut" "WorkingDirectory does not exist, so can't create shortcut."
			return
		}
	}

	Write-Debug "Creating Shortcut..."

	try {
		$global:WshShell = New-Object -com "WScript.Shell"
	    $lnk = $global:WshShell.CreateShortcut($shortcutFilePath)
	    $lnk.TargetPath = $targetPath
		$lnk.WorkingDirectory = $workingDirectory
	    $lnk.Arguments = $arguments
	    if($iconLocation) {
	        $lnk.IconLocation = $iconLocation
	    }
	    $lnk.Description = $description
	    $lnk.Save()

		Write-Debug "Shortcut created."

		Write-ChocolateySuccess "Install-ChocolateyShortcut completed"

	}
	catch {
		Write-ChocolateyFailure "Install-ChocolateyShortcut" "There were errors attempting to create shortcut. The error message was '$_'."
	}
}

$packageName = 'Atom' # arbitrary name for the package, used in messages
$url = 'https://github.com/bradgearon/atom/releases/download/v0.96.1/Atom.zip' # download url
$url64 = $url # 64bit URL here or just use the same as $url
$dest = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "$packageName.lnk"
Install-ChocolateyZipPackage "$packageName" "$url" "$dest" "$url64"
Install-ChocolateyShortcut -shortcutFilePath $link -targetPath "$dest\Atom.exe"