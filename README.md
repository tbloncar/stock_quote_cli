Stock Quote CLI
===============

[![Build Status](https://travis-ci.org/tbloncar/stock_quote_cli.png?branch=master)](https://travis-ci.org/tbloncar/stock_quote_cli)

### Description

Stock Quote CLI is a Ruby gem that provides a command-line interface for fetching stock information from Yahoo!. It relies on the [stock_quote gem](https://github.com/tyrauber/stock_quote) for fetching real-time and historical data.

![Demo](https://raw.githubusercontent.com/tbloncar/stock_quote_cli/master/demo.gif)

Update: Due to Google's sunsetting of iGoogle (and the associated endpoint from
which the stock_quote gem once fetched its data), the stock_quote gem has moved
to using the Yahoo! Finance API. This CLI gem has been updated to accommodate
the awesomely quick changes.

### Installation

With Ruby installed, run the following:

```
gem install stock_quote_cli
```

### Usage Details

You can use Stock Quote CLI to fetch real-time attributes of multiple stocks. Use the `stock` command in tandem with any of the available subcommands and stock symbols to fetch the relevant attribute(s).

#### Last Price

Get the latest price for the specified stock(s).

```
stock last goog yhoo aapl
```

#### Open Price

Get the opening price for the specified stock(s) on the current day (or last trading day).

```
stock open znga
```

#### Previous Closing Price

Get the closing price for the specified stock(s) on the previous trading day.

```
stock yclose amzn nflx
```

#### High Price

Get the high price for the specified stock(s) on the current day (or last trading day).

```
stock high lnkd
```

#### Low Price

Get the low price for the specified stock(s) on the current day (or last trading day).

```
stock low msft dell
```

#### Historical Data

Get historical data for a single stock. The default range is 14 days. The default value is the closing price. These can be specified using the `range` (aliased to `-r`) and `value` (aliased to `-v`) options, respectively.

```
stock history fb
```

The `range` (`-r`) option takes an integer. Use this to specify the number of trading days for which you'd like data.

```
stock history -r 15 fb
```

The `value` (`-v`) option takes a string. Use this to specify the price value that you'd like to see in the output. You can choose from the following:

* `open` (opening price)
* `close` (closing price)
* `high` (high price)
* `low` (low price)
* `volume` (share volume)

Below, we fetch the high price for the Facebook stock for the past 15 days.

```
stock history -r 15 -v high fb
```

### License

Copyright (c) 2015 Travis Loncar

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.



