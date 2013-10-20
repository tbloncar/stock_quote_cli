require "thor"
require "stock_quote"
require "stock_quote_cli/quote"
require "stock_quote_cli/history"

module StockQuoteCLI
	class CLI < Thor
		include StockQuoteCLI::Quote
		include StockQuoteCLI::History

		DEFAULT_RANGE = 10 # days

		desc "last SYMBOL [SYMBOL...]", "get LAST stock price for SYMBOL"
		def last(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :last)
		end

		desc "high SYMBOL [SYMBOL...]", "get HIGH stock price for SYMBOL"
		def high(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :high)
		end

		desc "low SYMBOL [SYMBOL...]", "get LOW stock price for SYMBOL"
		def low(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :low)
		end

		desc "change SYMBOL [SYMBOL...]", "get CHANGE in stock price for SYMBOL"
		def change(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :change)
		end

		desc "open SYMBOL [SYMBOL...]", "get OPEN stock price for SYMBOL"
		def open(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :open)
		end

		desc "yclose SYMBOL [SYMBOL...]", "get yesterday's closing (YCLOSE) stock price for SYMBOL"
		def yclose(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :y_close)
		end

		desc "volume SYMBOL [SYMBOL...]", "get share VOLUME for SYMBOL"
		def volume(symbol, *symbols)
			stocks = stocks(symbol, symbols)
			output_quote_messages(stocks, :volume)
		end

		desc "history SYMBOL", "get HISTORY of stock price for SYMBOL"
		method_option "range", aliases: "-r", type: :numeric, default: DEFAULT_RANGE, desc: "Specify the number of days for which to return stock price information."
		def history(symbol)
			stock_history = get_stock_history(symbol)
		end

		private

		def output_quote_messages(stocks, method_name)
			puts
			stocks.each do |stock|
				if stock.response_code == 200
					unless method_name == :volume
						puts "#{stock.company.green.rjust(40)}: $#{stock.send(method_name).number_with_commas}"
					else
						puts "#{stock.company.green.rjust(40)}: #{stock.send(method_name).number_with_commas} shares"
					end
				else
					puts bad_symbol_message(stock.symbol)
				end
			end
			puts
		end

		def bad_symbol_message(symbol)
			"#{'No data available for:'.rjust(28)} #{symbol}".red
		end
	end
end

class Float
	def number_with_commas
		split_on_dot = to_s.split("\.")
		whole = split_on_dot[0]
		decimal = split_on_dot[1] || ""
		char_array = whole.reverse.split(//)
		whole_with_commas = char_array.each_with_index.map do |char, i|
			if char_array.size > 3 && i % 3 == 0 && i > 0
				"#{char},"
			else
				char
			end
		end.reverse.join("")
		if decimal.size == 1
			decimal = "#{decimal}0"
		end
		"#{whole_with_commas}.#{decimal}"
	end
end