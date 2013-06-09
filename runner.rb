require_relative 'irc'
require_relative 'cockneybot'
require 'pry'

class Runner

	def self.run

		# Creates a new instance of IRC class
		irc = IRC.new
		# Connects to IRC
		irc.connect

		# Gets from IRC and puts to terminal screen
		until irc.s.eof? do
		input = irc.s.gets
	  	puts input

	  	# Creates a new instance of Cockneybot and sends it the input to be processed
	  	logic = Cockneybot.new.logic(input)

	  	# Outputs Cockneybot's response
	  	irc.output(logic) if logic != nil

		end # End of loop

	end
	
end

Runner.run