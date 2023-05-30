def next_bigger_num(num)
  num_digits = num.digits
  num_digits = num_digits.sort.reverse
  max_num = num_digits.join.to_i
  return -1 if num == num_digits.join.to_i || num_digits.size == 1
  # n of a range
  results_arr = []
  qq = ((num + 1).. max_num).select do |n|
    n.digits.sort == num.digits.sort
  end
  qq
end
#p next_bigger_num(9) == -1
p next_bigger_num(12) #== 531
p next_bigger_num(2017) #== 2071
#p next_bigger_num(111) == -1
p next_bigger_num(2027)