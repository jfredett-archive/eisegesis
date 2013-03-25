module Eisegesis
  module AST
    class Structure
      include Katuv::Node

      terminal Src
      terminal Obj
      terminal Test
      terminal Bin

      multiple SourceFile

      terminal License

      nonterminal Directory

    end
  end
end
