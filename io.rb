require 'socket'
require_relative 'logic'
require_relative 'irc_connection'
require 'pry'


class IO

	# Create new instance of Connection
	@c = Connection.new

	# Opens a new connection to IRC with the correct port and server.
	@irc = TCPSocket.open(@c.server, @c.port)

	# white noise... 
	# print("addr: ", s.addr.join(":"), "\n")
	# print("peer: ", s.peeraddr.join(":"), "\n")

	# Sets up a new IRC session using the settings from he Connection class.
	@irc.puts "USER #{@c.user} 0 * #{@c.user}"
	@irc.puts "NICK #{@c.nick}"
	@irc.puts "JOIN #{@c.channel}"
	@irc.puts "PRIVMSG #{@c.channel} :Awright geezzaaa! Hello from Cockneybot. Sorted mate."



	def self.output(message)
		@irc.puts "PRIVMSG #{@c.channel} :" + message.to_s
	end


	# Loop until the connection closes. Enclose all IO in here.
	until @irc.eof? do
		@input = @irc.gets.to_s
	  	puts @input


	  	if @input.include? "Hello"
	  		self.output("Hey!")
	  	end










	end







	# def self.output(message)
	# 	irc_connection.output(message)
	# end


	# while true
	# 	self.output("Testing 1..2..1..2")
	# 	puts "Testing!!!!!"
	# 	sleep 5
	# end


end	

	





	