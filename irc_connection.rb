class Connection

	attr_reader :server, :port, :nick, :channel, :user

	def initialize
	@server = "chat.freenode.net"
	@port = "6667"
	@nick = "CockneyBot"
	@user = "CockneyBot"
	@channel = "#bitmaker"
	end

end