module Thinreports::Preview
  class Tlist

    def initialize(config)
      @config = config
    end

    def name
      @config["id"].to_sym
    end

    def items
      list = {}
      @config["sections"][:detail].shapes.each do |k,v|
        list[k] = instance(v)
      end
      list
    end

    def header
      list = {}
      @config["sections"][:header].shapes.each do |k,v|
        list[k] = instance(v)
      end
      list
    end

    def footer
      list = {}
      @config["sections"][:footer].shapes.each do |k,v|
        list[k] = instance(v)
      end
      list
    end

    private
      def instance(obj)
        case obj.type
        when 's-tblock'
          Tblock.new(obj.instance_variable_get("@config"))
        end
      end

  end
end
