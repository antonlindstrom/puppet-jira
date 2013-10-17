require 'spec_helper'

describe 'jira::install' do
  describe 'jira::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_class('java7') }
    it { should contain_class('wget') }
    it { should contain_wget__fetch('download_jira') }
    it { should contain_exec('extract_jira') }
    it { should contain_file('/opt') }
    it { should contain_file('/etc/init.d/jira') }
  end

  describe 'jira::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_class('java7') }
    it { should contain_class('wget') }
    it { should contain_wget__fetch('download_jira') }
    it { should contain_exec('extract_jira') }
    it { should contain_file('/opt') }
    it { should contain_file('/etc/init.d/jira') }
  end
end
