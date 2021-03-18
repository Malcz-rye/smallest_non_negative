# run the code by passing the values of the array as parameters
# e.g
# ruby run.rb 1 2 3 4

# var setup
sorted = ARGV.map(&:to_i)
brute_answer = nil

# brute force
sorted.each_with_index do | item, index |
  unless item == index
    brute_answer = index
    break
  end
end
brute_answer ||= sorted.size

# showing results
puts "The brute forced answer is #{brute_answer}"

