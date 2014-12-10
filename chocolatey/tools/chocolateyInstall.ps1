$packageName = 'Atom'
$url = 'https://atom.io/download/windows'
$installerType = 'exe'
$silentArgs = '--silent'

Install-ChocolateyPackage $packageName $installerType $silentArgs $url
