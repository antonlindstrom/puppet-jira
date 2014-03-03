require 'spec_helper'

describe 'jira' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "jira class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('jira::params') }

        it { should contain_class('jira::install') }
        it { should contain_class('jira::config') }
        it { should contain_class('jira::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'jira class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
