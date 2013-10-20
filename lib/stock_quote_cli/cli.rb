require "thor"

module StockQuoteCLI
	class CLI < Thor
		desc "hello NAME", "say HELLO to NAME"
		def hello(name)
			puts "Hello, #{name}."
		end
	end
end