# JIRA

[![Build Status](https://travis-ci.org/antonlindstrom/puppet-jira.png?branch=master)](https://travis-ci.org/antonlindstrom/puppet-jira)

Puppet module for [Atlassian JIRA](https://www.atlassian.com/software/jira).

Installs a basic JIRA standalone installation in `/opt` and starts it.

## Example usage

Include with default parameters:

    include jira

Set max, min and permgen memory sizes:

    class { 'jira':
      minimum_memory => '512m',
      maximum_memory => '512m',
      permgen_size   => '2048m',
    }

Set JVM options for jira:

    class { 'jira':
      jvm_options => '-Djava.net.preferIPv4Stack=true',
    }

Setup Jira for SSL behind proxy:

    class { 'jira':
      secure_proxy  => true,
      proxy_host    => $::fqdn, # default
      proxy_port    => 443,     # default
    }

## License

See [LICENSE](LICENSE) file.
