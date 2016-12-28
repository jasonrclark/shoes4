require 'rbconfig'

class Shoes
  module SelectedBackend
    class << self
      def validate
        if RUBY_ENGINE != "jruby"
          puts <<-EOS

*******************************************************************************
The SWT backend for Shoes requires a 9.X version of JRuby.

You appear to be running the following Ruby instead:

  #{RUBY_DESCRIPTION}

Please download JRuby from http://jruby.org (or your favorite Ruby version
manager), reinstall the `shoes` gem, and try again.

Sorry for the inconvenience!
*******************************************************************************

EOS
          exit 1
        end
      end

      def generate(path)
        options = "-J-XstartOnFirstThread" if RbConfig::CONFIG["host_os"] =~ /darwin/

        "jruby #{options} #{path}/shoes-swt"
      end
    end
  end
end
