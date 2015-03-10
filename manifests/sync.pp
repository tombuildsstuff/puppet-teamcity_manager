class teamcity_manager::sync
{
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  exec { 'teamcity_manager::sync::sync-with-teamcity':
    command     => "${teamcity_manager::installDirectory}\\TeamCityManager.exe",
    logoutput   => true,
    require     => File[$teamcity_manager::configDirectory]
  }
}
