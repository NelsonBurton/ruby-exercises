class Code
	attr_accessor :actual_code
	def initialize
		@actual_code = []
		@actual_code[0] = randompeg
		@actual_code[1] = randompeg
		@actual_code[2] = randompeg
		@actual_code[3] = randompeg
		p @actual_code
	end
	private
	def randompeg
		pegs = ['R','G','B','Y','O','P']
		pegs[rand(6)]
	end
end