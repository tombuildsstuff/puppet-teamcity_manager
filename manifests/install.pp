class teamcity_manager::install
{
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  $zipFilePath = "${teamcity_manager::downloadDirectory}\\\\${teamcity_manager::fileName}"
  ensure_resource('file', "${teamcity_manager::workingDirectory}", { ensure => directory })
  ensure_resource('file', "${teamcity_manager::installDirectory}", { ensure => directory, require => File["${teamcity_manager::workingDirectory}"] })
  
  ensure_resource('file', "${teamcity_manager::configDirectory}", { ensure => directory, require => File["${teamcity_manager::installDirectory}"] })
  ensure_resource('file', "${teamcity_manager::buildConfigurationsDirectory}", { ensure => directory, require => File["${teamcity_manager::configDirectory}"] })
  ensure_resource('file', "${teamcity_manager::projectsDirectory}", { ensure => directory, require => File["${teamcity_manager::buildConfigurationsDirectory}"] })
  ensure_resource('file', "${teamcity_manager::usersDirectory}", { ensure => directory, require => File["${teamcity_manager::projectsDirectory}"] })
  ensure_resource('file', "${teamcity_manager::vcsRootsDirectory}", { ensure => directory, require => File["${teamcity_manager::usersDirectory}"] })
  
  
  exec { 'teamcity_manager::install::extract-into-directory':
    command => "${teamcity_manager::sevenZipFileName} e -o${teamcity_manager::installDirectory} -y ${zipFilePath}",
    creates => "${teamcity_manager::installDirectory}\\TeamCityManager.exe",
    path    => "${teamcity_manager::sevenZipFilePath}",
    require => File[$teamcity_manager::vcsRootsDirectory]
  }
  
  file { 'teamcity_manager::install::app-configuration-file':
     ensure  => file,
     mode    => '0777',
     path    => "${teamcity_manager::installDirectory}\\TeamCityManager.exe.config",
     content => template('teamcity_manager/TeamCityManager.exe.config.erb'),
     require => Exec['teamcity_manager::install::extract-into-directory']
  }

}