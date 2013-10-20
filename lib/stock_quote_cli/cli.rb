require "thor"
require "stock_quote"
require "stock_quote_cli/quote"

module StockQuoteCLI
	class CLI < Thor
		include StockQuoteCLI::Quote

		desc "last SYMBOL [SYMBOL...]", "get LAST stock price for SYMBOL"
		def last(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_messages(stocks, :last)
		end

		desc "high SYMBOL [SYMBOL...]", "get HIGH stock price for SYMBOL"
		def high(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_messages(stocks, :high)
		end

		desc "low SYMBOL [SYMBOL...]", "get LOW stock price for SYMBOL"
		def low(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_messages(stocks, :low)
		end

		desc "change SYMBOL [SYMBOL...]", "get CHANGE in stock price for SYMBOL"
		def change(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_messages(stocks, :change)
		end

		desc "open SYMBOL [SYMBOL...]", "get OPEN stock price for SYMBOL"
		def open(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_messages(stocks, :open)
		end

		desc "yclose SYMBOL [SYMBOL...]", "get yesterday's closing (YCLOSE) stock price for SYMBOL"
		def yclose(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_messages(stocks, :y_close)
		end

		private

		def output_messages(stocks, method_name)
			puts
			stocks.each do |stock|
				if stock.response_code == 200
					puts "#{stock.company.green.rjust(40)}: $#{stock.send(method_name)}"
				else
					puts bad_symbol_message(stock.symbol)
				end
			end
			puts
		end

		def bad_symbol_message(symbol)
			"No data available for #{symbol}".red.rjust(45)
		end
	end
end