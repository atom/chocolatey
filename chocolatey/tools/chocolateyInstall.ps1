$packageName = 'Atom'
$url = 'https://atom.io/download/windows'
$installerType = 'exe'
$silentArgs = '--quiet'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url
