class teamcity_manager::params
{
  $version                      = '1.0'
  $fileName                     = "teamcity-manager-${version}.zip"
  $downloadUrl                  = 'https://s3-eu-west-1.amazonaws.com/ibuildstuff/software/'
  $downloadDirectory            = 'C:\Temp\teamcity-manager'
  $workingDirectory             = 'C:\Apps'
  $installDirectory             = "${workingDirectory}\\teamcity-manager-${version}"
  $configDirectory              = "${installDirectory}\\configuration"

  $buildConfigurationsDirectory = "${configDirectory}\\build-configurations"
  $projectsDirectory            = "${configDirectory}\\projects"
  $usersDirectory               = "${configDirectory}\\users"
  $vcsRootsDirectory            = "${configDirectory}\\vcs-roots"

  # 7-Zip Settings
  $sevenZipFilePath             = 'C:\\Program Files\\7-Zip'
  $sevenZipFileName             = '7z.exe'

  # TeamCity Settings
  $teamcityServer               = 'teamcity.mydomain.com'
  $teamcityUsesSsl              = false
  $teamcityUsername             = 'puppet_admin'
  $teamcityPassword             = 'p@ssw0rd'
}
