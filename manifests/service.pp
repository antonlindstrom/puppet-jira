# == Class jira::service
#
# This class is meant to be called from jira
# It ensure the service is running
#
class jira::service {
  include jira::params

  service { $jira::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
