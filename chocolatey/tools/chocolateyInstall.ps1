. '.\functions.ps1'
$packageName = 'Atom' # arbitrary name for the package, used in messages
$url = 'https://github.com/bradgearon/atom/releases/download/v0.101.0/Atom.zip' # download url
$url64 = $url # 64bit URL here or just use the same as $url
$dest = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "$packageName.lnk"
Install-ChocolateyZipPackage "$packageName" "$url" "$dest" "$url64"
Install-ChocolateyShortcut -shortcutFilePath $link -targetPath "$dest\Atom.exe"
