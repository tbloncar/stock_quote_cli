module StockQuoteCLI
  module Quote
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

    class StockQuote::Stock
      private

      def to_ary
        [] << self
      end
    end
  end
end