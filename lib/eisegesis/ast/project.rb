module Eisegesis
  module AST
    class Project
      include Node

      nonterminal Structure
      nonterminal Products
      nonterminal Dependencies
    end
  end
end
