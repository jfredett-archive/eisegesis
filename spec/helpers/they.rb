module RSpec
  module Eisegesis
    module DSL
      module Macros
        def they_all(&block)
          example do
            subject.map do
              instance_eval &block
            end
          end
        end
      end
    end
  end
end
