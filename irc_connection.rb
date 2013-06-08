require "socket"

class Connection

	attr_accessor :output, :input

	server = "chat.freenode.net"
	port = "6667"
	nick = "CockneyBot"
	channel = "#bitmaker"
	@output = "PRIVMSG #{channel} :"

	# Opens a new connection to IRC with the correct port and server.
	connection = TCPSocket.open(server, port)

	# white noise... 
	# print("addr: ", s.addr.join(":"), "\n")
	# print("peer: ", s.peeraddr.join(":"), "\n")

	# Sets up a new IRC session using the settings above.
	connection.puts "USER CockneyBot 0 * CockneyBot"
	connection.puts "NICK #{nick}"
	connection.puts "JOIN #{channel}"
	connection.puts "PRIVMSG #{channel} :Awright geezzaaa! Hello from Cockneybot. Sorted mate."

	# While the connection is active, assign the input to the @input variable and put the input to the terminal display.
	until connection.eof? do
		@input = connection.gets.to_s
	  	puts @input
	end

end