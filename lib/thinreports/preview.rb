require "thinreports/preview/version"

module Thinreports
  module Preview
    # Your code goes here...
    require 'thinreports/preview/option'
    require 'thinreports/preview/generater'
    require 'thinreports/preview/tblock'
    require 'thinreports/preview/tlist'

    require 'thinreports'
    
    def self.run(args)
      option = Option.new(args)
      if option[:target].nil?
        Dir.glob('./template/*.tlf').each do |f|
          Thinreports::Preview::Generater.new(f).generate(option[:output])
        end
      else
        Thinreports::Preview::Generater.new(option[:target]).generate(option[:output])
      end
    end
  end
end
