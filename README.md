Stock Quote CLI
===============

[![Build Status](https://travis-ci.org/tbloncar/stock_quote_cli.png?branch=master)](https://travis-ci.org/tbloncar/stock_quote_cli)

### Description

Stock Quote CLI is a Ruby gem that provides a command-line interface for fetching stock information from Google. It relies on the [stock_quote gem](https://github.com/tyrauber/stock_quote) for fetching real-time and historical data.

### Installation

Not yet available; but eventually:

	gem install stock_quote_cli

### Usage Details

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

### License

Copyright (c) 2013 Travis Loncar

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.



