module StockQuoteCLI
	module History
		private

		def get_stock_history(symbol)
			StockQuote::Stock.history(symbol)
		end

		def trim_stock_history(stock_history, range)
			stock_history[0...range]
		end
	end
end