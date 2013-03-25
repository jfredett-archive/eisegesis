require 'unit_spec_helper'

describe Eisegesis::AST::Compiler do
  it_behaves_like 'an ast node'
  it_behaves_like 'a terminal node'
end
