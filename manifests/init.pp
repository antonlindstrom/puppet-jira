# == Class: jira
#
# Full description of class jira here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class jira (
  $minimum_memory = $jira::params::minimum_memory,
  $maximum_memory = $jira::params::maximum_memory,
  $permgen_size   = $jira::params::permgen_size
) inherits jira::params {

  # validate parameters here

  anchor { 'jira::begin': } ->
  class { 'jira::install': } ->
  class { 'jira::config': }
  class { 'jira::service': } ->
  anchor { 'jira::end': }

  Anchor['jira::begin']  ~> Class['jira::service']
  Class['jira::install'] ~> Class['jira::service']
  Class['jira::config']  ~> Class['jira::service']
}
