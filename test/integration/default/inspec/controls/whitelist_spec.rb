
describe file('/var/lib/clamav') do
  it { should be_directory }
  it { should be_owned_by 'clamav' }
  it { should be_grouped_into 'clamav' }
end
