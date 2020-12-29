def arr_combination(num)
  newArr = [*1..num].permutation(2).to_a
end

def get_comb(num, central_arr, comb_arr)
  arr = []
  for i in 0...comb_arr.length do
    if !central_arr.include?(comb_arr[i])
      arr << comb_arr[i]
    end
  end
  newArr = [arr[0]]
  for i in 0...arr.length do 
    if !newArr.join(',').split(',').include?(arr[i].join(',').split(',')[0]) && !newArr.join(',').split(',').include?(arr[i].join(',').split(',')[1])
      newArr << arr[i]
    end
  end
  if newArr.length != num/2 
    central_arr = []
    get_comb(num, central_arr, comb_arr)
  end
  [newArr, central_arr]
end

def flat_arr(arr, arr2)
  for i in 0...arr2.length do 
    arr << arr2[i]
  end
  arr
end

def pairing_problem(arr)
  result = {}
  j = 1
  central_arr = []
  for i in 0...arr.length do 
    comb_arr = arr_combination(arr[i])
    arr_pair = get_comb(arr[i], central_arr, comb_arr)[0]
    central_arr = get_comb(arr[i], central_arr, comb_arr)[1]
    result["week #{j}"] = arr_pair
    central_arr << flat_arr(central_arr, arr_pair)
    p "week #{j} :  #{arr_pair}"
    j += 1
  end
  result 
end
arr = [5, 5, 8, 5, 5, 5]
# [8, 8, 8, 8, 8, 8, 8]
# [8, 8, 8, 8, 12, 10, 20]
# [8, 8, 8, 8, 12, 10, 20, 18, 30, 10]
# [9, 5, 2, 7, 12, 13]
# [9, 5, 2, 7, 12, 13,20,50,50,50,60,60,50,70,100]
# arr2 = arr_combination()
pairing_problem(arr)
#p arr_combination(8)
# p get_comb([], arr2)
