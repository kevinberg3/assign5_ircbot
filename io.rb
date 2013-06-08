require_relative 'irc_connection'
require_relative 'logic'

Connection.new

class IO

	@input = Connection.input
	@output = Connection.output


	if @input.include? "hello"
		Connection.connection.puts @output + "Hello!!!"
		puts "Testtttttttt"
	end


end

	





	