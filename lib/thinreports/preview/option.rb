require 'optparse'

module Thinreports::Preview
  class Option < Hash
    
    def initialize(args)
      super nil
      op = OptionParser.new
      op.on('-t', '--target VAL') { |v| self[:target] = v }
      op.on('-o', '--output VAL') { |v| self[:output] = v }
      op.parse!(args)
    end

  end
end
