module Eisegesis
  module AST
    class Directory
      include Katuv::Node

      nonterminal Directory
      multiple SourceFile
    end
  end
end

