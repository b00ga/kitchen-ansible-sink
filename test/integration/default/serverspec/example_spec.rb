require 'serverspec'

# http://kitchen.ci/docs/getting-started/writing-server-test

# Required by serverspec
set :backend, :exec

#describe package('git'), :if => os[:family] == 'ubuntu' do
#  it { should be_installed }
#end
describe package('git') do
  it { should be_installed }
end

