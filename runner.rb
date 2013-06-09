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

	  	logic = Cockneybot.new.logic(input)
	  	irc.output(logic)

		end # End of loop


	end


end

Runner.run