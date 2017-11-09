require 'spec_helper'

describe 'wma-clamav::whitelist' do
  let(:chef_run) { ChefSpec::SoloRunner.new }

  before do
    # stub_command('crontab -u root -l | grep aide').and_return(false)
  end

  it 'Creates the configuration directory if one does not already exist' do
    chef_run.converge(described_recipe)
    expect(chef_run).to create_directory('/var/lib/clamav').with(
      user:   'clamav',
      group:  'clamav'
    )
  end

  it 'creates a whitelist template for signatures' do
    chef_run.node.normal['wma']['clamav']['config']['whitelist']['signatures']['definitions'] = ['SecuriteInfo.com.Adware.Skodna.Generic.JA.25338.10539.25885']
    chef_run.converge(described_recipe)
    expect(chef_run).to create_template('/var/lib/clamav/whitelist.ign2').with(
      user:   'clamav',
      group:  'clamav'
    )
  end

  it 'creates a whitelist template for files' do
    chef_run.node.normal['wma']['clamav']['config']['whitelist']['files']['definitions'] = ['/some/random/file.txt']
    chef_run.converge(described_recipe)
    expect(chef_run).to create_template('/etc/sysconfig/clamav').with(
      user:   'clamav',
      group:  'clamav'
    )
  end
end
