module StockQuoteCLI
	module History
		private

		def get_stock_history(symbol)
			StockQuote::Stock.history(symbol)
		end
	end
end