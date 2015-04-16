require './code.rb'

class Game
	@total_number_of_turns
	@hidden_code
	@current_turn_number
	@won

	def initialize(number_of_turns, hidden_code)
		@total_number_of_turns = number_of_turns
		@hidden_code = hidden_code
		@current_turn_number = 0
		@won = false
	end
	def all_guesses_used?
		#p @current_turn_number
		p @total_number_of_turns
		@total_number_of_turns == @current_turn_number
	end
	def get_guess_from_user
		@current_turn_number += 1
		puts "Enter your guess of pegs, separated by commas, options are R,G,B,Y,O,P; 4 peg places"
		user_input = gets.chomp
		user_input.split(",")
	end
	def player_correct?(guess)
		@won = true if guess == @hidden_code
		@won
	end
	def player_won?
		@won
	end
	def return_feedback(guess)
		feedback = ["S","S","S","S"]
		i = 0
		while i < 4
			feedback[i] = "E" if guess[i] == @hidden_code[i]
			i += 1
		end
		feedback
	end
end




puts "Welcome to Mastermind, now creating a new game."
puts "How many turns do you want to play?"
number_of_turns = gets.chomp.to_i
puts "Game now being initialized with #{number_of_turns} turns."

c = Code.new()
g = Game.new(number_of_turns, c.actual_code)

until g.all_guesses_used? || g.player_won?
	guess = g.get_guess_from_user
	if g.player_correct?(guess) 
		puts "Congrats you win!" 
	else
		puts "before feecback"
		p g.return_feedback(guess)
	end
	puts "end of until"
end

puts "Sorry you lost, the correct answer was #{c.actual_code}" unless g.player_won?
