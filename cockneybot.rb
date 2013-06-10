require_relative 'irc'

class Cockneybot

	def initialize
		@slang = {"stairs" => "apples and pears", "telephone" => "dog and bone", "look" => "butcher's hook"}
	end

	def logic(input)

	 	irc = IRC.new

	 	# Removes useless information from the string	 	
	 	input.slice!(/.*PRIVMSG #{irc.channel} :/)

	 	# Only process input that starts with cockneybot:
	 	if input.downcase.start_with? ('cockneybot:')

			# Removes 'cockneybot' from string and splits input into a multi string array
			input.slice!(/cockneybot:/i)

			# Splits the input string into a multi-string array
		 	splitinput = input.split

	 		# Iterates through the array and matches each word to keys in the hash
	 		splitinput.map! do |word|

	 			# If cockneybot finds a match for the word in the hash, it translates the word.
	 			if @slang.has_key?(word)
	 				word = @slang[word]
	 			else
	 				word = word
	 			end

	 		end

	 		# Recombine the splitinput array into a new string
	 		output = splitinput.join(' ').downcase

	 		# Return the final translated sentence.
	 		return "Your translation: #{output.capitalize}"

	 	end

	end

end

