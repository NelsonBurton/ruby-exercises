require 'set'

class Array
	def deep_dup
		copied_arr = []
		for element in self
			if element.is_a? Array
				copied_arr.push(element.deep_dup)
			else
				copied_arr.push(element)
			end
		end
		copied_arr
	end
end


class WordChainer
	attr_accessor :dictionary
	attr_accessor :current_words
	attr_accessor :all_seen_words

	def initialize(dictionary_file_name)
		@dictionary = Set.new
		@dictionary = File.readlines(dictionary_file_name).map { |x| x.chomp}
	end

	def create_adjacents(a)
		possible_words = []
		alphabet = "abcdefghijklmnopqrstuvwxyz"
		a.each_with_index do |letter, i|
			alphabet.chars.each do |alphabet_letter| 
				b = a.deep_dup
				b[i] = alphabet_letter
				possible_words.push(b.join)
			end
		end
		possible_words.uniq
	end

	def find_all_adjacents(target)
		all_possible_combos = create_adjacents(target.chars)
		all_possible_combos.select { |word| @dictionary.include?(word) }
	end

	def run(source, target)
		@current_words = [source]
		@all_seen_words = { source => nil }
		until @current_words.empty?
			new_current_words = []
			@current_words.each do |current_word| 
				adjacent_words = find_all_adjacents(current_word)
				adjacent_words.each do |adjacent_word |
					unless @all_seen_words.include?(adjacent_word)
						new_current_words.push(adjacent_word)
						@all_seen_words[adjacent_word] = current_word
					end
				end

			end
			p @all_seen_words
			return buildpath(target) unless @all_seen_words[target] == nil

			@current_words = new_current_words
		end
	end

	def buildpath(target)
		path = []
		curr_key = @all_seen_words[target]
		until curr_key == nil
			path.push(curr_key)
			curr_key = @all_seen_words[curr_key]
		end
		path.reverse
	end


end

wc = WordChainer.new('../projects/dictionary.txt')

p wc.run("market", "mutter")



