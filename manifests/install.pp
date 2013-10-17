# == Class jira::install
#
class jira::install {
  include jira::params
  include wget
  include java7

  $jira_version = $jira::params::version

  file { '/opt':
    ensure => directory,
  }

  wget::fetch { 'download_jira':
    source      => "http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${jira_version}.tar.gz",
    destination => "/opt/atlassian-jira-${jira_version}.tar.gz",
    timeout     => 0,
    verbose     => false,
    require     => File['/opt'],
  }

  exec { 'extract_jira':
    command   => "tar xzf /opt/atlassian-jira-${jira_version}.tar.gz",
    cwd       => '/opt',
    path      => '/usr/bin/:/bin/',
    logoutput => true,
    creates   => "/opt/atlassian-jira-${jira_version}-standalone",
    require   => Wget::Fetch['download_jira'],
  }

  file { '/etc/init.d/jira':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('jira/jira-init.erb'),
  }

}
