def isSorted?(check) 
	prevValue = 0
	check.each{ |x| 
		return false if x < prevValue
		prevValue = x
	}
	return true
end

def bubblesort(unsorted)
	until isSorted?(unsorted) do 
	unsorted.each_with_index { |x, i| 
		break if i == unsorted.length-1
		unsorted[i],unsorted[i+1] = unsorted[i+1],unsorted[i] if unsorted[i] > unsorted[i+1]
	}
	end
	unsorted
end


print bubblesort([2,5,1,3,4,3,3,4,5,6,45,3,2,1]).join(",")