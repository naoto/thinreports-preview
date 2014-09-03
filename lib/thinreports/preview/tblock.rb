module Thinreports::Preview
  class Tblock

    def initialize(config)
      @config = config
    end

    def name
      @config["id"].to_sym
    end

    def preview_text(char = 'X')
      char * word_lenght
    end

    private
      def word_lenght
        (@config["box"]["width"] / @config["svg"]["attrs"]["font-size"].to_i).ceil
      end

  end
end
