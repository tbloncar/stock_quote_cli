module StockQuoteCLI
	module History
		private

    def get_stock_history(symbol, range)
      end_date = Date.today
      start_date = end_date - range
      StockQuote::Stock.history(symbol, start_date, end_date)
    end
	end
end