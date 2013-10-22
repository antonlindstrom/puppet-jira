require 'spec_helper'

describe 'jira::config' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}
  it { should contain_user('jira') }
  it { should contain_file('/home/jira') }
  it { should contain_file('setenv.sh') }
end
