$packageName = 'Atom'
$url = 'https://atom.io/download/windows'
$installerType = 'exe'
$installArgs = '/quiet'

Install-ChocolateyPackage $packageName $installerType $installArgs $url
