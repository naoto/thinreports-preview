module Thinreports::Preview
  class Generater

    def initialize(file)
      @file = file
    end

    def generate(output, list_loop)
      name = File.basename(@file, '.*')
      shapes = ::ThinReports::Layout.new(@file).format.shapes
      ::ThinReports::Report.generate_file("#{output}/#{name}.pdf", :layout => @file) do
        start_new_page
        shapes.each do |k,v|
          case shapes[k].type
          when 's-list'
            tlist = Tlist.new(shapes[k].instance_variable_get("@config"))

            list(tlist.name).events.on :footer_insert do |e|
              tlist.footer.each do |key,val|
                e.section.item(key).value(val.preview_text)
              end
            end

            list_loop.times do |i|
              list(tlist.name).add_row do |row|
                tlist.header.each do |key,item|
                  row.item(key).value(item.preview_text)
                end
                tlist.items.each do |key, item|
                    row.item(key).value(item.preview_text)
                  end
              end
            end

          when 's-tblock'
            tblock = Tblock.new(shapes[k].instance_variable_get("@config"))
            page.values(tblock.name => tblock.preview_text)
          end
        end
      end
    end

  end
end
