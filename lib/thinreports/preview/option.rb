require 'optparse'

module Thinreports::Preview
  class Option < Hash
    
    def initialize(args)
      super nil

      self[:output] = './generate'
      self[:list_loop] = 1

      op = OptionParser.new
      op.on('-t', '--target VAL') { |v| self[:target] = v }
      op.on('-o', '--output VAL') { |v| self[:output] = v.gsub(/[\/\\"]$/,'') }
      op.on('-l', '--list-loop VAL') { |v| self[:list_loop] = v.to_i }
      op.parse!(args)
    end

  end
end
