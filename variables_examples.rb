require 'pry'

####################################################
# Instance variable VS Class Instance Variable
####################################################
class Hello
	@hello = "hello"
  def display
    puts @hello
  end
end

h = Hello.new
h.display
####################################################


####################################################
# Class variable VS Class Instance Variable
####################################################
class Human
	@@total_number_of_humans = 0
	# @total_number = 0
	
	# class << self
	# 	attr_accessor :total_number
	# end

	def initialize
		@house = 0
		# Human.total_number += 1
		@@total_number_of_humans += 1
	end

  # def self.total_number
  #   return @total_number
  # end

  # def self.total_number=(input)
  # 	@total_number = input
  # end

  def self.total_number_of_humans
  	@@total_number_of_humans
  end

  def gets_a_house
  	@house += 1
  end

end


class Accountant < Human
	@total_number = 0
	
	class << self
		attr_accessor :total_number
	end

	def initialize
		@house = 0
		Accountant.total_number += 1
		@@total_number_of_humans += 1
	end	
end

class Mom < Human
	@total_number = 0
	
	class << self
		attr_accessor :total_number
	end

	def initialize
		@house = 0
		Mom.total_number += 1
		@@total_number_of_humans += 1
	end		
end
####################################################

binding.pry
