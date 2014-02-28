# == Class jira::config
#
# This class is called from jira
#
class jira::config {
  include jira::params

  $jira_home    = $jira::params::home
  $jira_version = $jira::params::version

  $proxy_host = $jira::params::proxy_host
  $proxy_port = $jira::params::proxy_port

  user { 'jira':
    ensure => present,
    home   => $jira_home,
  }

  file { $jira_home:
    ensure  => directory,
    owner   => 'jira',
    require => User['jira'],
  }

  file { 'setenv.sh':
    ensure => present,
    path   => "/opt/atlassian-jira-${jira_version}-standalone/bin/setenv.sh",
    mode   => '0755',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/jira/setenv.sh',
  }

  file { 'server.xml':
    ensure  => present,
    path    => "/opt/atlassian-jira-${jira_version}-standalone/conf/server.xml",
    mode    => '0755',
    owner   => root,
    group   => root,
    content => template('jira/server.xml.erb'),
  }

}
