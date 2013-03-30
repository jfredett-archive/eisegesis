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
      puts @config.visit(PrettyPrinter.new)
    end

    def structure
      return @structure if @structure
      @structure ||= Structure.new grab(AST::Structure)
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

  class PrettyPrinter < Eisegesis::AST::Visitor
    def initialize
      @depth = -1
    end

    def before(*_)
      @depth += 1
    end

    def after(*_)
      @depth -= 1
    end

    def unknown(node)
      puts ("  "*@depth) + node.inspect
    end
  end

  class Structure
    def initialize(base_dir, node)
      @base_dir = base_dir
      @node = node
    end

    def self.named_dir(name, klass)
      define_method(name) do
        ivar = instance_variable_get(name)
        return ivar unless ivar.nil?

        node = grab(klass)
        instance_variable_set(name, ivar = base_directory.find_directory(node.name))
        ivar
      end
    end

    def self.named_file(name, klass)
      define_method(name) do
        ivar = instance_variable_get(name)
        return ivar unless ivar.nil?

        node = grab(klass)
        instance_variable_set(name, ivar = base_directory.find_file(node.name))
        ivar
      end
    end

    named_dir :src, AST::Src
    named_dir :bin, AST::Bin
    named_dir :obj, AST::Obj
    named_dir :test, AST::Test

    named_file :license, AST::License

    def directories
    end
  end
end
