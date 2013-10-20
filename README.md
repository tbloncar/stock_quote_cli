Stock Quote CLI
===============

Description
-----------

Stock Quote CLI is a Ruby gem that provides a command-line interface for fetching stock information from Google. It relies on the [stock_quote gem](https://github.com/tyrauber/stock_quote) for fetching real-time and historical data.

Installation
------------

Not yet available; but eventually:

	gem install stock_quote_cli


Usage Details
-------------

You can use Stock Quote CLI to fetch real-time attributes of multiple stocks. Use the `stock` command in tandem with any of the available subcommands and stock symbols to fetch the relevant attribute(s).

#### Last Price

Get the latest price for the specified stock(s).

	stock last goog yhoo aapl

#### Open Price

Get the opening price for the specified stock(s) on the current day (or last trading day).

	stock open znga

#### Yesterday's Closing Price

Get the closing price for the specified stock(s) on the previous day (or last trading day).

	stock yclose amzn nflx

#### High Price

Get the high price for the specified stock(s) on the current day (or last trading day).

	stock high lnkd

#### Low Price

Get the low price for the specified stock(s) on the current day (or last trading day).

	stock low msft dell


License
-------------
MIT



