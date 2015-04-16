def binary_search(array, val, low=0, high=5)
    return nil if high < low
    mid = (low + high) / 2
    case
      when array[mid] > val then binary_search(array, val, low, mid-1)
      when array[mid] < val then binary_search(array, val, mid+1, high)
      else mid
    end
end


def bsearch2(array, target)
	binary_search(array, target, 0, array.length-1)
end


def bsearch(array, target)
	middle = array.length/2 
	if array[middle]  == target
		return middle - 1
	elsif array[middle] > target
		return middle + bsearch(array[0..middle-1], target) 
	else array[middle] < target 
		return middle - bsearch(array[middle+1..array.length-1], target)
	end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 1) # => 2
=begin

p array.length
p array[array.length/2-1]
p array[0..array.length/2-1]
p array[array.length/2..array.length-1]
p 5/2



p bsearch([2, 4, 6, 8, 10], 6) # => 2

bsearch([1, 3, 4, 5, 9], 5) # => 3

bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
=end