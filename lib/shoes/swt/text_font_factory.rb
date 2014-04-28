class Shoes
  module Swt
    class TextFontFactory
      include Common::DisposeOf

      def create_font(font_style)
        name = font_style[:name]
        size = font_style[:size]
        styles = font_style[:styles].reduce { |result, s| result | s }

        mark_to_dispose do
          ::Swt::Font.new Shoes.display, name, size, styles
        end
      end
    end
  end
end
