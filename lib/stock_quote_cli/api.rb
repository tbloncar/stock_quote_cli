require "stock_quote"

module StockQuoteCLI
  class API
    def self.stock_history(symbol, range)
      end_date = Date.today
      start_date = end_date - range
      StockQuote::Stock.history(symbol, start_date, end_date)
    end

    def self.stocks_info(symbols)
      [] + StockQuote::Stock.quote(symbols.join(", "))
    end

    class StockQuote::Stock
      private

      def to_ary
        [] << self
      end
    end
  end
end