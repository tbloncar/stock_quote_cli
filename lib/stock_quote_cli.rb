require "stock_quote_cli/cli"

module StockQuoteCLI
  class TextHelpers
    class << self
      # color methods from https://github.com/pierot/stockery/blob/master/lib/stockery.rb
      def red(str); color(str, "\e[31m"); end
      def green(str); color(str, "\e[1m\e[32m"); end
      def yellow(str); color(str, "\e[0;33m"); end

      private

      def color(text, color_code)  
        "#{color_code}#{text}\e[0m" 
      end
    end
  end
end