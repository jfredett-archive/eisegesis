require 'integration_spec_helper'

# TODO: Promote this into an integration spec, just test API level stuff here.
describe Eisegesis::Configuration do
  before do
    puts "DEBUG -- TRAVIS"
    puts "__FILE__ #{__FILE__}"
    puts "project_path: #{project_path}"
    puts "project_path exists? #{File.directory? project_path}"
    puts "content of project_path: #{`ls #{project_path}`}"
    puts "content of path via Dir: #{Dir[File.join(project_path, '*')]}"
    #puts "exegesis config file: #{project_directory.find_file('exegesis')}"
    #puts "content via Exegesis: #{project_directory.find_file('exegesis').content}"
    puts "config value: #{configuration.config}"
    puts "structure value: #{configuration.config.structure}"
  end

  let(:project_path) { File.expand_path(File.join('..', '..', 'fake_project'), __FILE__) }
  let(:project_directory) { Exegesis::BaseDirectory.create(project_path) }

  subject(:configuration) { Eisegesis::Configuration.new(project_directory) }
  it { should be_valid } #validations on the 'AST'

  describe '#structure'
    let(:structure) { configuration.structure }

    describe '#src' do
      subject { structure.src }

      its(:path) { should == File.join(project_path, 'src') }
    end

    describe '#bin' do
      subject { structure.bin }

      its(:path) { should == File.join(project_path, 'bin') }
    end

    describe '#obj' do
      subject { structure.obj }

      its(:path) { should == File.join(project_path, 'obj') }
    end

    describe '#test' do
      subject { structure.test }

      its(:path) { should == File.join(project_path, 'test') }
    end
end

