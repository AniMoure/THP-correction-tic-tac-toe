require 'pry'

class TicTacToe

	def initialize
		case_values
		instantiate_players
		loop do
			board
			player_1_plays
			break if check_if_game_over

			board
			player_2_plays
			break if check_if_game_over
		end

		board
		game_over
	end

	def instantiate_players
		# Creates player 1
		puts "JOUEUR 1:"
		puts 'Tape ton nom suivi de la touche entrée'
		@player1 = gets.chomp
		sleep(0.5)
		puts "Bienvenue #{@player1}"

		# Creates player 2
		puts "JOUEUR 2:"
		puts 'Tape ton nom suivi de la touche entrée'
		@player2 = gets.chomp
		sleep(0.5)
		puts "Bienvenue #{@player2}"
	end

	def case_values
		@case_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
	end

	def board
		puts"\n"
		puts"-----------"
		puts" #{@case_array[0]} | #{@case_array[1]} | #{@case_array[2]}"
		puts"-----------"
		puts" #{@case_array[3]} | #{@case_array[4]} | #{@case_array[5]}"
		puts"-----------"
		puts" #{@case_array[6]} | #{@case_array[7]} | #{@case_array[8]}"
		puts"-----------"
		puts"\n"
	end

	def corresponding_case(input)
		case input.to_i
		when 1
			@case1
		when 2
			@case2
		when 3
			@case3
		when 4
			@case4
		when 5
			@case5
		when 6
			@case6
		when 7
			@case7
		when 8
			@case8
		when 9
			@case9
		else
		end
	end

	def player_1_plays
		puts "JOUEUR 1"
		puts "\n"
		input = gets.chomp
		if @case_array.include?(input) && input.to_i != 0
			@case_array[input.to_i - 1] = "x"			
		else
			puts "Valeur incorrecte"
		end
	end

	def player_2_plays
		puts "JOUEUR 2"
		puts "\n"		
		input = gets.chomp
		if @case_array.include?(input) && input.to_i != 0
			@case_array[input.to_i - 1] = "o"
		else
			puts "Valeur incorrecte"
		end		
	end

	def check_if_game_over
		if player_wins
			true
		elsif no_remaining_squares
			true
		else
			false
		end
	end

	def player_wins
		# Horizontal
		condition_1 = @case_array[0] == @case_array[1] && @case_array[1] == @case_array[2]
		condition_2 = @case_array[3] == @case_array[4] && @case_array[4] == @case_array[5]
		condition_3 = @case_array[6] == @case_array[7] && @case_array[7] == @case_array[8]

		# Vertical
		condition_4 = @case_array[0] == @case_array[3] && @case_array[3] == @case_array[6]
		condition_5 = @case_array[1] == @case_array[4] && @case_array[4] == @case_array[7]
		condition_6 = @case_array[2] == @case_array[5] && @case_array[5] == @case_array[8]		

		# Diagonal
		condition_7 = @case_array[0] == @case_array[4] && @case_array[4] == @case_array[8]
		condition_8 = @case_array[2] == @case_array[4] && @case_array[4] == @case_array[6]		

		if condition_1 || condition_2 || condition_3 || condition_4 || condition_5 || condition_6 || condition_7 || condition_8
			true
		else
			false
		end
	end

	def no_remaining_squares
		available_case_array = [] 
		@case_array.map{|case_value| available_case_array << case_value if case_value.to_i != 0}
		if available_case_array.count == 0
			true
		else
			false
		end
	end

	def game_over
		puts "\n"		
		puts "GAME OVER"
		puts "\n"		
	end	
end

TicTacToe.new
