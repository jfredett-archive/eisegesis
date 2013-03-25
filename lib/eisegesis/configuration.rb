module Eisegesis
  class Configuration
    extend Forwardable

    def initialize(base_directory)
      @base_directory = case base_directory
                        when String # assume it's a path to a directory
                          Exegesis::BaseDirectory.new(base_directory)
                        when Exegesis::BaseDirectory # use it
                          base_directory
                        when Directory # grab it's path and make it a base directory
                          Exegesis::BaseDirectory.new(base_directory.path)
                        else # assume they gave us something that will work
                          base_directory
                        end
    end
    attr_reader :base_directory

    delegate [:valid?, :invalid?, :errors] => :validation

    def config
      # read the file, build the project AST from it.
      @config ||= eval base_directory.find_file('exegesis').content
    end

    def src_dir
      return @src_dir if @src_dir
      node = grab(AST::Src)
      @src_dir = base_directory.find_directory(node.name)
    end

    def bin_dir
      return @bin_dir if @bin_dir
      node = grab(AST::Bin)
      @bin_dir = base_directory.find_directory(node.name)
    end

    def validate!
      @validation ||= AST::Validator.new.tap do |validator|
        config.visit(validator)
      end
    end
    alias validation validate!

    private

    delegate :visit => :config
    def grab(klass)
      visit(grab = NodeGrabber.new(klass))
      grab.result
    end
  end

  class NodeGrabber < Eisegesis::AST::Visitor
    attr_reader :result

    def initialize(klass)
      @klass = klass
    end

    def unknown(node)
      @result ||= node if node.is_a? @klass
    end
  end

  class Structure
    def src
    end

    def obj
    end

    def test
    end

    def bin
    end

    def license
    end

    def substructures
    end
  end
end
