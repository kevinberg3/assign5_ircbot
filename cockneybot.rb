require_relative 'irc'

class Cockneybot

	def initialize
		@slang = {"stairs" => "apples", "telephone" => "dog and bone", "look" => "butchers",
		"believe" => "adam and eve", "gravy" => "army", "phone" => "dog and bone", "legs" => "bacons",
		"leg" => "bacon", "hair" => "barnet", "money" => "bees", "knees" => "biscuits", "balls" => "cobblers",
		"head" => "loaf", "heads" => "loafs", "silly" => "daffy", "arse" => "Khyber", "ass" => "Khyber",
		"eyes" => "minces", "eye" => "mince", "dollar" => "oxford", "dollars" => "oxfords", "stinks" => "pens",
		"talking" => "rabbiting", "talk" => "rabbit", "fart" => "raspberry", "farted" => "raspberried",
		"go" => "scarpa", "wife's" => "trouble's", "wife" => "trouble", "shirt" => "uncle", "shirts" => "uncles",
		"coat" => "weasel", "coats" => "weasels", "starving" => "marvin", "socks" => "docks", "bottle" => "aristotle",
		"lodger" => "Artful", "braces" => "ascots", "queen" => "baked bean", "queen's" => "baked bean's", 
		"walk" => "ball", "walking" => "balling", "cash" => "bangers", "judge" => "barnaby", "an argument" => "a barney",
		"trouble" => "barney", "face" => "boat", "faces" => "boats", "weed" => "bob", "dope" => "bob", "soap" => "bob",
		"skint" => "boracic", "sneeze" => "bread and cheese", "sneezed" => "bread and cheesed", "daughter" => "brick",
		"daughters" => "bricks", "tits" => "bristols", "titty" => "bristol", "tit" => "bristol", "boobs" => "bristols",
		"dead" => "brown bread", "greek" => "bubble", "arm" => "chalk", "mate" => "china", "sun" => "currant",
		"boots" => "daisies", "boot" => "daisy", "moan" => "darby", "word" => "dicky", "shoes" => "dinky doos", "skive" => "duck",
		"rent" => "duke", "kid" => "dustbin", "nose" => "fireman's hose", "road" => "frog", "scotch" => "gold",
		"cheque" => "gregory", "neck" => "gregory", "draught" => "george", "piss" => "gypsy", "pee" => "gypsy",
		"car" => "jam", "dance" => "kick", "dancing" => "kicking", "fiver" => "lady", "windy" => "mork", "deaf" => "mutton",
		"mouth" => "north and south", "tie" => "peckham", "feet" => "plates", "crap" => "pony", "lie" => "porky", "lies" => "porkies",
		"tea" => "rosie", "fork" => "roast pork", "pub" => "rub-a-dub", "curry" => "ruby", "goal" => "sausage roll", 
		"cab" => "sherbert", "sister" => "skin", "pocket" => "sky rocket", "flying squad" => "sweeney", "wigs" => "syrups",
		"wig" => "syrup", "thief" => "tea leaf", "shit" => "tom tit", "alone" => "todd", "sick" => "tom and dick", "window" => "tommy",
		"gin" => "vera", "jewellery" => "tom foolery", "jewelry" => "tom foolery", "suit" => "whistle"}
	end

	def logic(input)

	 	irc = IRC.new

	 	# Removes useless information from the string	 	
	 	input.slice!(/.*PRIVMSG #{irc.channel} :/)

	 	# Only process input that starts with cockneybot:
	 	if input.downcase.start_with? ('cockneybot:')

			# Removes 'cockneybot' from string
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

