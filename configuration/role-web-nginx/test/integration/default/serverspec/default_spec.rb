require 'spec_helper'

describe 'role-web-nginx::default' do
  describe package('nginx') do
    it { should be_installed }
  end
  describe file('/etc/nginx/sites-available/default') do
    it { should be_file }
    it { should contain "proxy_pass http://goapp"}
  end
  describe file('/etc/nginx/nginx.conf') do
    it { should be_file }
    it { should contain 'upstream goapp' }
  end
  describe service('nginx') do
    it { should be_running }
  end
end
