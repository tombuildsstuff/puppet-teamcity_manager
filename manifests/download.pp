class teamcity_manager::download
{
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  ensure_resource('file', "${teamcity_manager::downloadDirectory}", { ensure => directory })
  download_file { "teamcity_manager::download::get-${teamcity_manager::version}":
    destination_directory => $teamcity_manager::downloadDirectory,
    require               => File["${teamcity_manager::downloadDirectory}"],
    url                   => "${teamcity_manager::downloadUrl}${teamcity_manager::fileName}"
  }
}