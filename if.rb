num = 10
if num >= 10 then
  puts "Hello World!"
end

#演習1
def check(num)
  if num == 42 then
    puts "Answer to the Ultimate Question of Life, then Universe, and Everything"
  end
end
check(42)

#演習2
even_nums = []
odd_nums = []

def sort_number(num, even_nums, odd_nums)
  if num % 2 == 0 then
    even_nums.append(num)
  else
    odd_nums.append(num)
  end
end
sort_number(21, even_nums, odd_nums)
sort_number(42, even_nums, odd_nums)

p even_nums
p odd_nums