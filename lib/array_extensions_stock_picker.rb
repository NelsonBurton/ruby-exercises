class Array
	def my_uniq
		shorter = []
		self.each { |x| shorter.push(x) unless shorter.include?(x)}
		shorter
	end
end

def stock_picker(prices)
	max_diffs_array = {}
	for n in 1..prices.length-1
		j = 0
		deltashash = {}
		for j in 0..n-1
			deltashash[j] = prices[n] - prices[j]
		end
		max_diffs_array[n] = deltashash.max_by { | k,v |  v }
	end
	puts max_diffs_array
    max_diffs_array.max_by{ |k,v| v[1] }
end



puts [1,2,3,2,3,5,5,4].my_uniq



puts stock_picker([25,25,26,27,24,23,21,24,28,37,39,22,10,12,13,26,34]) # == [12,16]

puts (1..5).to_a.any?{ |i| i%2!= 0}