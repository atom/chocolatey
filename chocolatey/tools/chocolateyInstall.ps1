# Remove old apm shim
$apmPath = Join-Path $nugetExePath "apm.bat"
if (Test-Path ($apmPath)) {Remove-Item $apmPath -force}

# Remove old atom.exe shim
$atomPath = Join-Path $nugetExePath "atom.exe"
if (Test-Path ($atomPath)) {Remove-Item $atomPath -force}

# Run installer
$packageName = 'Atom'
$url = 'https://atom.io/download/windows'
$url64 = 'https://atom.io/download/windows_x64'
$installerType = 'exe'
$silentArgs = '--silent'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url $url64
