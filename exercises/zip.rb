def zip(first_arr, second_arr)
  zipped = []
  first_arr.each_with_index do |item, idx|
    zipped << [item, second_arr[idx]]
  end
  zipped
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
