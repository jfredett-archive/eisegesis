require 'integration_spec_helper'

# TODO: Promote this into an integration spec, just test API level stuff here.
describe Eisegesis::Configuration do
  let(:project_directory) { Exegesis::BaseDirectory.new('./spec/fake_project') }

  subject(:configuration) { Eisegesis::Configuration.new(project_directory) }
  it { should be_valid } #validations on the 'AST'

  describe 'src_dir' do
    subject { configuration.src_dir }

    its(:path) { should == './spec/fake_project/src' }
  end

  describe 'bin_dir' do
    subject { configuration.bin_dir }

    its(:path) { should == './spec/fake_project/bin' }
  end
end

