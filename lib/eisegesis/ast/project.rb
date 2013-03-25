module Eisegesis
  module AST
    class Project
      include Katuv::Node

      nonterminal Structure
      nonterminal Products
      nonterminal Dependencies
    end
  end
end
