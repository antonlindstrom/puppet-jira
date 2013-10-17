# == Class jira::params
#
# This class is meant to be called from jira
# It sets variables according to platform
#
class jira::params {
  $version = '6.0'
  $home    = '/home/jira'

  case $::osfamily {
    'Debian': {
      $package_name = 'jira'
      $service_name = 'jira'
    }
    'RedHat', 'Amazon': {
      $package_name = 'jira'
      $service_name = 'jira'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
