module Eisegesis
  module AST
    class SourceFile
      include Katuv::Node
      terminal!

      def self.name
        "File"
      end
    end
  end
end

