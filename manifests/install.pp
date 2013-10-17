# == Class jira::install
#
class jira::install {
  include jira::params
  include java7

  $jira_version = $jira::params::version

  file { '/opt':
    ensure => directory,
  }

  exec { 'download_jira':
    command   => "curl -L http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${jira_version}.tar.gz | tar zx",
    cwd       => '/opt',
    path      => '/usr/bin/:/bin/',
    logoutput => true,
    creates   => "/opt/atlassian-jira-${jira_version}-standalone",
    require   => File['/opt'],
  }

}
