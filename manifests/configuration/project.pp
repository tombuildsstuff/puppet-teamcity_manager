define teamcity_manager::configuration::project(
  $ensure = 'present',
  $config,
  $directory = $teamcity_manager::projectsDirectory
)
{
  $fileName = "${directory}\\${config['name']}.json"
  if $ensure == 'present'
  {
    file { $fileName:
      content => template('teamcity_manager/project.json.erb'),
      require => File["${directory}"],
      notify  => Class['teamcity_manager::sync']
    }
  }
  elsif $ensure == 'absent'
  {
	  file { $fileName:
	  	ensure => absent
	  }
  }
}
