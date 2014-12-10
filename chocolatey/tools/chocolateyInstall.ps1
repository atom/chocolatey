$packageName = 'Atom'
$url = 'https://atom.io/download/windows'
$installerType = 'exe'

Install-ChocolateyPackage $packageName $installerType $url
