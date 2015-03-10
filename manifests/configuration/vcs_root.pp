define teamcity_manager::configuration::vcs_root(
  $ensure = 'present',
  $config,
  $directory = $teamcity_manager::vcsRootsDirectory
)
{
  $fileName = "${directory}\\${config['name']}.json"
  if $ensure == 'present'
  {
    file { $fileName:
    	content => template('teamcity_manager/vcs_root.json.erb'),
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
