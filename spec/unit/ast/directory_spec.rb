require 'unit_spec_helper'

describe Eisegesis::AST::Directory do
  it_behaves_like 'an ast node'
  it_behaves_like 'a nonterminal node'
end
