require "thor"
require "stock_quote"

module StockQuoteCLI
	class CLI < Thor
		desc "last SYMBOL [SYMBOL...]", "get LAST stock price for SYMBOL"
		def last(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			stocks.each { |stock| puts "#{stock.company}: $#{stock.high}" }
		end

		desc "high SYMBOL [SYMBOL...]", "get HIGH stock price for SYMBOL"
		def high(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			stocks.each { |stock| puts "#{stock.company}: $#{stock.high}" }
		end

		desc "low SYMBOL [SYMBOL...]", "get LOW stock price for SYMBOL"
		def low(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			stocks.each { |stock| puts "#{stock.company}: $#{stock.low}" }
		end

		desc "change SYMBOL [SYMBOL...]", "get CHANGE in stock price for SYMBOL"
		def change(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			stocks.each { |stock| puts "#{stock.company}: $#{stock.change}" }
		end

		private

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
	end

	class StockQuote::Stock
		private

		def to_ary
			[] << self
		end
	end
end