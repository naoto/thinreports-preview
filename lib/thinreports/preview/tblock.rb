module Thinreports::Preview
  class Tblock

    def initialize(config)
      @config = config
    end

    def name
      @config["id"].to_sym
    end

    def preview_text
      if date?
        format_type_char
      else
        ((format_type_char * word_lenght) + return_code) * line_length
      end
    end

    private
      def date?
        @config["format"]["type"] == "datetime"
      end

      def word_lenght
        length = (@config["box"]["width"] / @config["svg"]["attrs"]["font-size"].to_i)
        if length < 1
          1
        else
          length
        end
      end

      def line_length
        if @config["multiple"]
          (@config["box"]["height"] / @config["svg"]["attrs"]["font-size"].to_i).ceil
        else
          1
        end
      end

      def format_type_char
        case @config["format"]["type"]
        when "number"
          "9"
        when "padding"
          "9"
        when "datetime"
          Time.now
        else
          "XX"
        end
      end

      def return_code
        if @config["multiple"]
          "\n"
        else
          ""
        end
      end

  end
end
