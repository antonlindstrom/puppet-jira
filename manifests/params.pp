# == Class jira::params
#
# This class is meant to be called from jira
# It sets variables according to platform
#
class jira::params {
  $version = '6.0'
  $home    = '/home/jira'

  $permgen_size    = '384m'
  $minimum_memory  = '384m'
  $maximum_memory  = '1024m'

  $secure_proxy = false

  $proxy_port = 443
  $proxy_host = $::fqdn

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
