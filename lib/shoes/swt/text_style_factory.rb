class Shoes
  module Swt
    class TextStyleFactory
      UNDERLINE_STYLES = {
        "single" => 0,
        "double" => 1,
        "error" => 2,
      }

      include Common::DisposeOf

      def create_style(font, foreground, background, opts)
        fg = swt_color(foreground, ::Shoes::COLORS[:black])
        bg = swt_color(background)
        @latest_style = ::Swt::TextStyle.new font, fg, bg
        set_underline(opts)
        set_undercolor(opts)
        set_rise(opts)
        set_strikethrough(opts)
        set_strikecolor(opts)
        @latest_style
      end

      def self.apply_styles(styles, opts)
        styles[:font_detail][:styles] = parse_font_style(opts)
        styles[:font_detail][:name] = opts[:font] if opts[:font]
        styles[:font_detail][:size] = opts[:size] if opts[:size]
        styles[:fg] = opts[:stroke]
        styles[:bg] = opts[:fill]
        styles[:font_detail][:size] *= opts[:size_modifier] if opts[:size_modifier]
        styles.merge(opts)
      end

      def self.parse_font_style(opts)
        font_styles = []
        font_styles << ::Swt::SWT::BOLD if opts[:weight]
        font_styles << ::Swt::SWT::ITALIC if opts[:emphasis]
        font_styles << ::Swt::SWT::NORMAL if !opts[:weight] && !opts[:emphasis]
        font_styles
      end

      attr_reader :style

      private
      def set_rise(opts)
        @latest_style.rise = opts[:rise]
      end

      def set_underline(opts)
        @latest_style.underline = opts[:underline].nil? || opts[:underline] == "none" ? false : true
        @latest_style.underlineStyle = UNDERLINE_STYLES[opts[:underline]]
      end

      def set_undercolor(opts)
        @latest_style.underlineColor = color_from_dsl opts[:undercolor]
      end

      def set_strikethrough(opts)
        @latest_style.strikeout = opts[:strikethrough].nil? || opts[:strikethrough] == "none" ? false : true
      end

      def set_strikecolor(opts)
        @latest_style.strikeoutColor = color_from_dsl opts[:strikecolor]
      end

      def swt_color(color, default = nil)
        return color if color.is_a? ::Swt::Color
        color_from_dsl color, default
      end

      def color_from_dsl(dsl_color, default = nil)
        return nil if dsl_color.nil? and default.nil?
        return color_from_dsl default if dsl_color.nil?

        mark_to_dispose do
          ::Swt::Color.new(Shoes.display, dsl_color.red, dsl_color.green, dsl_color.blue)
        end
      end
    end
  end
end
