module Eisegesis
  module AST
    class Dependencies
      include Katuv::Node

      multiple Compiler
      multiple Package
    end
  end
end

