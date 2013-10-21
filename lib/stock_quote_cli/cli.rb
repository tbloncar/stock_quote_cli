require "thor"
require "stock_quote"
require "stock_quote_cli/quote"
require "stock_quote_cli/history"

module StockQuoteCLI
	class CLI < Thor
		include StockQuoteCLI::Quote
		include StockQuoteCLI::History

		DEFAULT_RANGE = 10 # days
		DEFAULT_VALUE = "close"
		VALUE_OPTIONS = ["open", "high", "low", "close", "volume"]

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
		method_option "range", aliases: "-r", type: :numeric, default: DEFAULT_RANGE, desc: "Specify the number of trading days for which to return stock price information."
		method_option "value", aliases: "-v", type: :string, default: DEFAULT_VALUE, desc: "Specify the stock price value to retrieve for each date."
		def history(symbol)
			stock_history = get_stock_history(symbol)
			trimmed_stock_history = trim_stock_history(stock_history, options['range'])
			value = options['value']
			output_history_messages(trimmed_stock_history, value, VALUE_OPTIONS, symbol)
		end

		private

		def output_quote_messages(stocks, method_name)
			puts
			stocks.each do |stock|
				if stock.response_code == 200
					company = format_company(stock.company)
					unless method_name == :volume
						price = format_price(stock.send(method_name))
						puts "#{company}: #{price}"
					else
						volume = format_volume(stock.send(method_name))
						puts "#{company}: #{volume}"
					end
				else
					puts bad_symbol_message(stock.symbol)
				end
			end
			puts
		end

		def output_history_messages(stock_history, method_name, method_options, symbol)
			puts 
			unless stock_history.empty?
				if method_options.include?(method_name)
					puts format_title(method_name, symbol)
					puts
					stock_history.each do |day|
						date = format_date(day.date)
						unless method_name == "volume"
							price = format_price(day.send(method_name))
							puts "#{date}: #{price}"
						else
							volume = format_volume(day.send(method_name))
							puts "#{date}: #{volume}"
						end
					end
				else
					puts bad_value_message(method_name)
				end
			else
				puts bad_symbol_message(symbol)
			end
			puts
		end

		def bad_symbol_message(symbol)
			"#{'No data available for:'.rjust(28)} #{symbol}".red
		end

		def bad_value_message(value_name)
			"#{'Invalid value:'.rjust(28)} #{value_name}".red
		end

		def format_company(company)
			company.green.rjust(40)
		end

		def format_date(date)
			date.strftime('%m/%d/%Y').gsub("0013", "2013").green.rjust(40)
		end

		def format_price(price)
			"$#{price.number_with_commas}"
		end

		def format_volume(volume)
			"#{volume.number_with_commas} shares"
		end

		def format_title(method_name, symbol)
			"#{method_name.upcase.yellow} data for".rjust(38) + ": #{symbol.upcase.yellow}"
		end
	end
end

class Numeric
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
		unless decimal == "" || decimal == "00"
			"#{whole_with_commas}.#{decimal}"
		else
			"#{whole_with_commas}"
		end
	end
end