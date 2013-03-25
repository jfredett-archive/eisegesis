require 'unit_spec_helper'

describe Eisegesis::AST::Project do
  subject do
    project('foo') do
    end
  end

  it_behaves_like 'an ast node'

  describe 'api' do
    it { should respond_to :name }

    it { should respond_to :structure    }
    it { should respond_to :products     }
    it { should respond_to :dependencies }

    its(:structure)    { should be_a_kind_of Eisegesis::AST::Structure    }
    its(:products)     { should be_a_kind_of Eisegesis::AST::Products     }
    its(:dependencies) { should be_a_kind_of Eisegesis::AST::Dependencies }
  end

  describe '#structure' do
    it 'parses structure calls' do
      expect {
        project 'foo' do
          structure do
          end
        end
      }.to_not raise_error
    end

    it 'parses overspecified structure calls' do
      expect {
        project 'foo' do
          structure do
          end

          structure do
          end
        end
      }.to_not raise_error
    end

    it "does not parse if nested incorrectly" do
      expect { project 'foo' do
        structure do
          structure do
          end
        end
      end }.to raise_error
    end
  end

  describe '#products' do
    it 'parses #products calls' do
      expect {
        project 'foo' do
          products do
          end
        end
      }.to_not raise_error
    end

    it 'parses overspecified products calls' do
      expect {
        project 'foo' do
          products do
          end

          products do
          end
        end
      }.to_not raise_error
    end
  end

  describe '#dependencies' do
    it 'parses #dependencies calls' do
      expect {
        project 'foo' do
          dependencies do
          end
        end
      }.to_not raise_error
    end

    it 'parses overspecified dependencies calls' do
      expect {
        project 'foo' do
          dependencies do
          end

          dependencies do
          end
        end
      }.to_not raise_error
    end
  end
end
