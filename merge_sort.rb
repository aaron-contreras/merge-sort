# frozen_string_literal: true

def merge(left_half, right_half)
  merged_array = []

  loop do
    break merged_array += right_half if left_half.empty?
    break merged_array += left_half if right_half.empty?

    merged_array << if left_half.first < right_half.first
                      left_half.shift
                    else
                      right_half.shift
                    end
  end
end

def merge_sort(array)
  return array if array.empty?
  return array if array.length == 1

  left_half = array[0...(array.length / 2)]
  right_half = array[(array.length / 2)..-1]

  sorted_left_half = merge_sort left_half
  sorted_right_half = merge_sort right_half

  merge sorted_left_half, sorted_right_half
end

# Tests

p merge_sort []        # => []
p merge_sort [1]       # => [1]
p merge_sort [1, 2]    # => [1, 2]
p merge_sort [2, 1]    # => [1, 2]
p merge_sort [2, 1, 1] # => [1, 1, 2]
p merge_sort [3, 1, 2] # => [1, 2, 3]
p merge_sort [5, 1, 9, 8, 2, 6, 6, 6, 6, 6, 7] # => [1, 2, 5, 6, 6, 6, 6, 6, 7, 8, 9]
