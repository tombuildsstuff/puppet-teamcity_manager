Puppet-TeamCity Manager
===============

A puppet module to configure TeamCity Manager on Windows Systems.
[![Project Build Status](https://travis-ci.org/tombuildsstuff/puppet-teamcity_manager.svg?branch=master)](https://travis-ci.org/tombuildsstuff/puppet-teamcity_manager)

Installation
------------

Add this to your Puppetfile:
```puppet
mod 'tombuildsstuff/teamcity_manager'
````

Usage
-----
Configure TeamCity Manager on a system:
```
class { '::teamcity_manager':
  teamcityServer   => 'teamcity.mydomain.com',
  teamcityUsesSsl  => false,
  teamcityUsername => 'puppetadmin',
  teamcityPassword => 'p@ssw0rd',
}
```

Add a Project:
```
teamcity_manager::configuration::project { 'MyApplication-Project':
  config => {
    name => 'My Application'
  }
}
```

Add a VCS Root:
```
teamcity_manager::configuration::vcs_root { 'MyApplication-VCSRoot':
  config => {
    name => 'My Application VCS Root',
    type => 'Git',
    settings => {
      authentication     => 'PrivateKeyFile',
      branch             => 'master',
      privateKeyFilePath => 'C:\\SSHKeys\\id_rsa.priv',
      privateKeyPassword => 'p@ssw0rd',
      repositoryUrl      => 'git@github.com:mycompany/myproject.git',
    }
  }
}
```

Add a Build Configuration (triggered on VCS pushes):
```
teamcity_manager::configuration::build_configuration { "MyApplication-BuildConfig":
  ensure => 'present',
  config => {
    name     => 'Build and Run Unit Tests',
    project  => 'My Application',
    steps    => [
      {
        name => 'Run Grunt Build',
        type => 'CustomScript',
        settings => {
          customScript => "grunt build"
        }
      }
    ],
    triggers => [
      {
        type => 'vcs',
        settings => { }
      },
    ],
    vcsRoots => [ 'My Application VCS Root' ]
  }
}
```

Add a user:
```
teamcity_manager::configuration::user { 'user':
  config => {
    username => 'user',
    password => 'p@ssw0rd',
    email    => 'me@mydomain.com',
    fullName => 'User Name'
  }
}
```

TODO

Testing
-------
This module's been tested on Windows Server 2008 R2 - it *should* work on just about any version of windows as well, but I haven't tested it..

Contributing
------------
Send a pull request, ideally with tests :)
