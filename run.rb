# run the code by passing the values of the array as parameters
# e.g
# ruby run.rb 1 2 3 4

# var setup
@sorted = ARGV.map(&:to_i)
@brute_answer = nil
@brute_time = 0
@divide_and_conquer_answer = nil
@divide_and_conquer_time = 0

# brute force
@sorted.each_with_index do |item, index|
  @brute_time += 1
  unless item == index
    @brute_answer = index
    break
  end
end
@brute_answer ||= @sorted.size

# divide and conquer
def recurse(min, max)
  @divide_and_conquer_time += 1
  if min == max
    if @sorted[min] == min
      @divide_and_conquer_answer = min + 1
    else
      @divide_and_conquer_answer = min
    end
    return
  end
  middle = (((max - min) / 2) + min).to_i
  if @sorted[middle] == middle
    # Do right half
    recurse(middle + 1, max)
  else
    # Do left half
    recurse(min, middle)
  end
end
recurse(0, @sorted.size - 1)


# showing results
puts "The brute forced answer is #{@brute_answer}" \
     " and took #{@brute_time} amount of time"
puts "The divide and conquer answer is #{@divide_and_conquer_answer}" \
     " and took #{@divide_and_conquer_time} amount of time"
