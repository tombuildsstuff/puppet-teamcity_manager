define teamcity_manager::configuration::user(
  $ensure = 'present',
  $config,
  $directory = $teamcity_manager::usersDirectory
)
{
  $fileName = "${directory}\\${config['username']}.json"
  if $ensure == 'present'
  {
    file { $fileName:
      content => template('teamcity_manager/user.json.erb'),
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
