class Array
	def my_uniq
		shorter = []
		self.each { |x| shorter.push(x) unless shorter.include?(x)}
		shorter
	end
	def my_each
		for element in self
			yield(element)
		end
	end
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

arr = [[31],[32],[33]]
arr2 = arr.deep_dup
arr[1] = 5
p arr
p arr2
arr.my_each { |x| print "eachis: #{x}"}
