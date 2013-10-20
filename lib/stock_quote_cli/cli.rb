require "thor"
require "stock_quote"

module StockQuoteCLI
	class CLI < Thor
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
			stocks.each do |stock|
				if stock.response_code == 200
					puts "#{stock.company}: $#{stock.send(method_name)}"
				else
					puts bad_symbol_message(stock.symbol)
				end
			end
		end

		def stocks(symbol, symbols)
			symbol_string = symbol_string(symbol, symbols)
			get_stocks(symbol_string)
		end

		def symbol_string(symbol, symbols)
			symbols.unshift(symbol).join(", ")
		end

		def get_stocks(symbol_string)
			[] + StockQuote::Stock.quote(symbol_string)
		end

		def bad_symbol_message(symbol)
			"No data available for #{symbol}."
		end
	end

	class StockQuote::Stock
		private

		def to_ary
			[] << self
		end
	end
end