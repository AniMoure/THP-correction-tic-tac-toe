require 'pry'

########################################################################
# GAME CLASS
# 
########################################################################
class Game

	def initialize
		puts "-----------------------------"
		puts "--                         --"
		puts "--   --  TIC-TAC-TOE  --   --"
		puts "--                         --"
		puts "-----------------------------"
		puts "\n\n\n"
	end

	def initialize_players
		@player1 = Player.new("x")
		@player2 = Player.new("o")
		@array_of_game_players = [@player1, @player2]
	end

	def turn_of(player)
		puts "JOUEUR #{player.id}"
		puts player.name
		puts "\n"
		print "Sélectionne une case disponible: "
		input = gets.chomp
		if input_is_valid(input)
			squares_array = @board.squares_array
			squares_array[input.to_i - 1] = player.symbol	
			@board.update_squares(squares_array)
		else
			puts "Valeur incorrecte"
		end
	end

	def input_is_valid(input)
		if @board.squares_array.include?(input) && input.to_i != 0
			return true
		else
			false
		end
	end

	def game_over
		if player_wins
			return true
		elsif no_remaining_squares
			return true
		else
			return false
		end
	end

	def player_wins
		@line_is_complete = false
		winning_solutions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		winning_solutions.each do |index_array|
			if @board.squares_array[index_array[0]] == @board.squares_array[index_array[1]] && @board.squares_array[index_array[1]] == @board.squares_array[index_array[2]]
				@line_is_complete = true
				break
			end
		end
		return @line_is_complete
	end

	def no_remaining_squares
		available_case_array = [] 
		@board.squares_array.map{|case_value| available_case_array << case_value if case_value.to_i != 0}
		if available_case_array.count == 0
			return true
		else
			return false
		end
	end

	def end_game
		puts "\n"		
		puts "\n"		
		puts "\n"		
		puts "GAME OVER"
		puts "\n"		
		puts "\n"		
		puts "\n"		
	end	

	def play
		initialize_players
		@board = Board.new
		go_to_end_game = false
		# catch :go_to_end_game do
			loop do
				break if go_to_end_game
				@array_of_game_players.each do |player|
					turn_of(player)
					@board.display_board
					# throw :go_to_end_game if game_over
					if game_over
						go_to_end_game = true
						break
					end
				end
			end
		# end
		end_game
	end
end
########################################################################


########################################################################
# PLAYER CLASS
# 
########################################################################
class Player
	@array_of_players = []
	def initialize(symbol = "")
		puts 'Tape ton nom suivi de la touche entrée'

		player_id = self.set_id
		print "JOUEUR #{player_id}: "

		player_name = self.get_name
		puts "Bienvenue #{player_name}"

		puts "\n"

		@player_hash = {id: player_id, name: player_name, symbol: symbol}
		Player.array_of_players << @player_hash
	end

	def set_id
		return Player.array_of_players.count + 1
	end

	def get_name
		return gets.chomp
	end

	def id
		return self.data_hash[:id]
	end

	def name
		return self.data_hash[:name]
	end

	def symbol
		return self.data_hash[:symbol]
	end	

	def data_hash
		return @player_hash
	end

	def self.array_of_players
		return @array_of_players
	end
end
########################################################################


########################################################################
# BOARD CLASS
# 
########################################################################
class Board

	def initialize
		@squares_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
		display_board
	end

	def update_squares(array)
		@squares_array = array
	end

	def squares_array
		return @squares_array
	end

	def display_board
		puts"\n"
		puts"-----------"
		puts" #{@squares_array[0]} | #{@squares_array[1]} | #{@squares_array[2]}"
		puts"-----------"
		puts" #{@squares_array[3]} | #{@squares_array[4]} | #{@squares_array[5]}"
		puts"-----------"
		puts" #{@squares_array[6]} | #{@squares_array[7]} | #{@squares_array[8]}"
		puts"-----------"
		puts"\n"		
	end
end
########################################################################

binding.pry
Game.new.play
