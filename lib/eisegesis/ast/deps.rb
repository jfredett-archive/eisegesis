module Eisegesis
  module AST
    class Deps
      include Katuv::Node
      terminal!

      def self.name
        'Dependencies'
      end
    end
  end
end
