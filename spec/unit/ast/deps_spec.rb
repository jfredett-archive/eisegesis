require 'unit_spec_helper'

describe Eisegesis::AST::Deps do
  it_behaves_like 'an ast node'
  it_behaves_like 'a terminal node'

  its('class.name') { should == 'Dependencies' }
end
