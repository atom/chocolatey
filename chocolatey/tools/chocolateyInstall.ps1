$packageName = 'Atom'
$url = 'https://atom.io/download/windows'
$installerType = 'exe'
$silentArgs = ''

Install-ChocolateyPackage $packageName $installerType $silentArgs $url
