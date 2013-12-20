class Shoes
  module Swt
    class TextBlockCursorPainter
      def initialize(dsl, fitted_layouts)
        @dsl = dsl
        @fitted_layouts = fitted_layouts
      end

      def draw
        if @dsl.cursor
          draw_textcursor
        else
          remove_textcursor
        end
      end

      ## TODO: Fix to span between multiple layouts properly. Currently just
      ## puts the cursor in the last one
      ##
      ## TODO: Also noticed existing bug when the position is past the end of
      ## the text, we'll crash instead of setting to the end like Shoes3
      def draw_textcursor
        #  text_layout = fitted_layout.layout
        #  layout_height = text_layout.get_line_bounds(0).height

        #  @dsl.textcursor ||= @dsl.app.line(0, 0, 0, layout_height, strokewidth: 1, stroke: @dsl.app.black, hidden: true)
        #  cursor_position = @dsl.cursor == -1 ? @dsl.text.length - 1 : @dsl.cursor
        #  cursor_position = 0 if cursor_position < 0
        #  pos = text_layout.getLocation cursor_position, true

        @dsl.textcursor.move(0, 0)
                             #fitted_layout.left + pos.x,
                             #fitted_layout.top + pos.y).show
      end

      def remove_textcursor
        return unless @dsl.textcursor

        @dsl.textcursor.remove
        @dsl.textcursor = nil
      end
    end
  end
end
