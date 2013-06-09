require 'socket'

class IRC

	attr_accessor :s

	def initialize
		@server = "chat.freenode.net"
		@port = "6667"
		@nick = "CockneyBot"
		@user = "CockneyBot"
		@channel = "#bitmaker_james"
	end

	def connect
		# Open a socket to IRC
		@s = TCPSocket.open(@server, @port)

		# Send attributes to IRC
		@s.puts "USER #{@user} 0 * #{@user}"
		@s.puts "NICK #{@nick}"
		@s.puts "JOIN #{@channel}"
		@s.puts "PRIVMSG #{@channel} :Awright geezzaaa! Hello from Cockneybot. Sorted mate."
	end

	def output(message)
		@s.puts "PRIVMSG #{@channel} :" + message.to_s
	end

end


