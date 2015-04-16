require 'json'
require 'awesome_print'

test_dict = { :a => 1, :b => 2}
jsonversion = test_dict.to_json
ap jsonversion
ap JSON.parse(jsonversion)
ap [[1,2,3],[3], 4]

def sqrt(num)
  unless num >= 0
    raise ArgumentError.new "Cannot take sqrt of negative number"
  end
  if num >= 100
  	raise StandardError.new "number way too big"
  end

  # code to calculate square root...
  return 3

end
def main
  # run the main program in a loop
  while true
    # get an integer from the user
    puts "Please input a number"
    num = gets.to_i

    begin
      sqrt(num)
    rescue ArgumentError => e
      puts "Couldn't take the square root of #{num}"
      puts "Error was: #{e.message}"
    rescue StandardError => ez
    	puts ez.message
    end

  end
end

main