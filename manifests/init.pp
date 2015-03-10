class teamcity_manager(
  $version                      = $teamcity_manager::params::version,
  $fileName                     = $teamcity_manager::params::fileName,
  $downloadUrl                  = $teamcity_manager::params::downloadUrl,
  $downloadDirectory            = $teamcity_manager::params::downloadDirectory,
  $workingDirectory             = $teamcity_manager::params::workingDirectory,
  $installDirectory             = $teamcity_manager::params::installDirectory,
  $configDirectory              = $teamcity_manager::params::configDirectory,
  $buildConfigurationsDirectory = $teamcity_manager::params::buildConfigurationsDirectory,
  $projectsDirectory            = $teamcity_manager::params::projectsDirectory,
  $usersDirectory               = $teamcity_manager::params::usersDirectory,
  $vcsRootsDirectory            = $teamcity_manager::params::vcsRootsDirectory,

  $sevenZipFilePath             = $teamcity_manager::params::sevenZipFilePath,
  $sevenZipFileName             = $teamcity_manager::params::sevenZipFileName,
  $teamcityServer               = $teamcity_manager::params::teamcityServer,
  $teamcityUsesSsl              = $teamcity_manager::params::teamcityUsesSsl,
  $teamcityUsername             = $teamcity_manager::params::teamcityUsername,
  $teamcityPassword             = $teamcity_manager::params::teamcityPassword
)
inherits teamcity_manager::params
{
  class { 'teamcity_manager::download': } ->
  class { 'teamcity_manager::install': } ->
  class { 'teamcity_manager::sync': }
}
