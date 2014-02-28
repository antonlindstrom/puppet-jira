require 'spec_helper'

describe 'jira::config' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}
  it { should contain_user('jira') }
  it { should contain_file('/home/jira') }
  it { should contain_file('setenv.sh') }

  context 'server.xml with secure_proxy => true' do
    let(:params) { {:secure_proxy => true} }

    it do
      should contain_file('server.xml').with_content(/secure="true"/)
    end
  end

  context 'server.xml with secure_proxy => false' do
    let(:params) { {:secure_proxy => false} }

    it do
      should contain_file('server.xml').with_content(/secure="false"/)
    end
  end

end
