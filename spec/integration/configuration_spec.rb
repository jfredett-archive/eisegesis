require 'integration_spec_helper'

# TODO: Promote this into an integration spec, just test API level stuff here.
describe Eisegesis::Configuration do
  let(:project_directory) { Exegesis::BaseDirectory.new('./spec/fake_project') }

  subject(:configuration) { Eisegesis::Configuration.new(project_directory) }
  it { should be_valid } #validations on the 'AST'

  describe '#structure'
    let(:structure) { configuration.structure }

    describe '#src' do
      subject { structure.src }

      its(:path) { should == './spec/fake_project/src' }
    end

    describe '#bin' do
      subject { structure.bin }

      its(:path) { should == './spec/fake_project/bin' }
    end

    describe '#obj' do
      subject { structure.obj }

      its(:path) { should == './spec/fake_project/obj' }
    end

    describe '#test' do
      subject { structure.test }

      its(:path) { should == './spec/fake_project/test' }
    end
end

