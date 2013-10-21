require "stock_quote_cli/cli"

class String
	# color methods from https://github.com/pierot/stockery/blob/master/lib/stockery.rb
	def red; color(self, "\e[31m"); end
	def green; color(self, "\e[1m\e[32m"); end
	def yellow; color(self, "\e[0;33m"); end

	def color(text, color_code)  
  	"#{color_code}#{text}\e[0m" 
  end
end