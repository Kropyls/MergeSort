# frozen_string_literal: true

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result.push(left[0] < right[0] ? left.shift : right.shift)
  end
  # add in whatever is left over once array comparison is done
  (result << right).flatten! unless right.empty?
  (result << left).flatten! unless left.empty?
  result
end

def merge_sort(arr)
  return arr if arr.size < 2

  # left should always be the smaller if uneven member count in arr
  left, right = arr.each_slice((arr.size / 2.0).round).to_a
  left = merge_sort(left)
  right = merge_sort(right)
  merge(left, right)
end

p merge_sort([3, 10, 2, 1, 5, 0, 4, 9, 7, 8, 6])
