require "thor"
require "stock_quote"

module StockQuoteCLI
  class CLI < Thor
    desc "last SYMBOL [SYMBOL...]", "get day's LAST stock price for SYMBOL"
    def last(*symbols)
      output_info(symbols, :last_trade_price_only)
    end

    desc "high SYMBOL [SYMBOL...]", "get day's HIGH stock price for SYMBOL"
    def high(*symbols)
      output_info(symbols, :days_high)
    end

    desc "low SYMBOL [SYMBOL...]", "get day's LOW stock price for SYMBOL"
    def low(*symbols)
      output_info(symbols, :days_low)
    end

    desc "change SYMBOL [SYMBOL...]", "get day's CHANGE in stock price for SYMBOL"
    def change(*symbols)
      output_info(symbols, :change)
    end

    desc "open SYMBOL [SYMBOL...]", "get day's OPEN stock price for SYMBOL"
    def open(*symbols)
      output_info(symbols, :open)
    end

    desc "pclose SYMBOL [SYMBOL...]", "get previous closing (PCLOSE) stock price for SYMBOL"
    def pclose(*symbols)
      output_info(symbols, :previous_close)
    end

    desc "volume SYMBOL [SYMBOL...]", "get share VOLUME for SYMBOL"
    def volume(*symbols)
      output_info(symbols, :volume)
    end

    desc "history SYMBOL", "get HISTORY of stock price for SYMBOL"
    method_option "range", aliases: "-r", type: :numeric, default: 14, desc: "Specify the number of trading days for which to return stock price information."
    method_option "value", aliases: "-v", type: :string, default: "close", desc: "Specify the stock price value to retrieve for each date."
    def history(symbol)
      history = API.stock_history(symbol, options['range'])
      output_stock_history(history, options['value'], symbol)
    end

    private

    def output_info(symbols, vname)
      stocks = API.stocks_info(symbols)
      output_stocks_info(stocks, vname)
    end

    def output_stocks_info(stocks, vname)
      puts
      stocks.each do |quote|
        # Ensure that quote object has data. If not,
        # it probably represents an invalid symbol.
        if quote.open
          company = format_company(quote.name)
          if vname == :volume
            puts "#{company}: #{format_volume(quote.volume)}"
          else
            puts "#{company}: #{format_price(quote.send(vname))}"
          end
        else
          output_bad_symbol_message(quote.symbol)
        end
      end
      puts
    end

    def output_stock_history(history, vname, symbol)
      return output_bad_symbol_message(symbol) if history.is_a?(StockQuote::NoDataForStockError)

      voptions = %w[open high low close volume]
      if voptions.include?(vname)
        puts "\n#{format_title(vname, symbol)}\n"
        history.each do |quote|
          date = format_date(quote.date.to_s)
          if vname == "volume"
            puts "#{date}: #{format_volume(quote.send(vname))}"
          else
            puts "#{date}: #{format_price(quote.send(vname))}"
          end
        end
      else
        output_bad_vname_message(vname)
      end
      puts
    end

    def output_bad_symbol_message(symbol)
      puts Text.red("No data available for symbol: #{symbol.upcase}".rjust(28))
    end

    def output_bad_vname_message(vname)
      puts Text.red("#{'Invalid value:'.rjust(28)} #{vname}")
    end

    def format_company(company)
      Text.green(company).rjust(40)
    end

    def format_date(date)
      Text.green(date).rjust(40)
    end

    def format_price(price)
      "$#{Text.number_with_commas(price)}"
    end

    def format_volume(volume)
      "#{Text.number_with_commas(volume.to_i)} shares"
    end

    def format_title(vname, symbol)
      "#{Text.yellow(vname.upcase)} data for:".rjust(39) +
        " #{Text.yellow(symbol.upcase)}\n"
    end
  end
end