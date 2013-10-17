# == Class jira::config
#
# This class is called from jira
#
class jira::config {
  include jira::params

  $jira_home = $jira::params::home

  user { 'jira':
    ensure => present,
    home   => $jira_home,
  }

  file { $jira_home:
    ensure  => directory,
    owner   => 'jira',
    require => User['jira'],
  }
}
