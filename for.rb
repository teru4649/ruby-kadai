# for num in 1..10 do
#   puts "Hello World!"
# end

# #演習1
# for i in 1..30 do
#   puts i
# end

# #演習2
# for i in 1..30 do
#   if i % 5 == 0 then
#     puts "Buzz"
#   else
#     puts i
#   end
# end

#演習3
for i in 1..30 do
  if i % 3 ==0 and i % 5 == 0 then
    puts "FizzBuzz"
  elsif i % 3 == 0 then
    puts "Fizz"
  elsif i % 5 == 0 then
    puts "Buzz"
  else
    puts i
  end
end