require 'spec_helper'

describe 'jira::install' do
  describe 'jira::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_class('java7') }
    it { should contain_exec('download_jira') }
    it { should contain_file('/opt') }
  end

  describe 'jira::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_class('java7') }
    it { should contain_exec('download_jira') }
    it { should contain_file('/opt') }
  end
end
