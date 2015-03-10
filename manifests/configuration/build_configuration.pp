define teamcity_manager::configuration::build_configuration(
  $ensure,
  $config,
  $directory = $teamcity_manager::buildConfigurationsDirectory
)
{
  $fileName = "${directory}\\${config['project']}-${config['name']}.json"
  if $ensure == 'present'
  {
	  file { $fileName:
	    content => template('teamcity_manager/build_configuration.json.erb'),
	    ensure  => file,
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
