require 'exegesis'

require 'eisegesis/version'
require 'eisegesis/ast.rb'
require 'eisegesis/configuration.rb'

module Eisegesis ; end

# The top level method to define a configuration
def project(name = nil, opts={}, &block)
  Eisegesis::AST::Project.new(name, opts.merge(parent: nil), &block)
end
