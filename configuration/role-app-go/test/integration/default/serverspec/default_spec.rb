require 'spec_helper'

describe 'role-app-go::default' do
  describe package('gccgo-go') do
    it { should be_installed }
  end
  %w(
    /opt/go/bin
    /opt/go/src/goapp
  ).each do |dir|
    describe file(dir) do
      it { should be_directory }
    end
  end
  %w(
    /opt/go/src/goapp/goapp.go
    /opt/go/bin/goapp
    /etc/init/goapp.conf
  ).each do |gofile|
    describe file(gofile) do
      it { should be_file }
    end
  end
  describe file('/etc/init.d/goapp') do
    it { should be_symlink }
  end
  describe service('goapp') do
    it { should be_enabled }
    it { should be_running }
  end
  describe port(8484) do
    it { should be_listening }
  end
end
