require 'spec_helper'

describe 'jira::service' do
  describe 'jira::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('jira') }
  end

  describe 'jira::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('jira') }
  end
end

