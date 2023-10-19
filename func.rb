def hello(str)
  puts str
end
hello("Hello Ruby!")

#演習1
def calc(a,b)
  puts a * b
end
calc(2,3)

#演習2
def triangle_area(a,h)
  return a * h /2
end
puts triangle_area(2,3)

#演習3
$file_list = []
def add_list(name)
  file_name = name + ".rb"
  $file_list.append(file_name)
end

add_list("function")
puts $file_list

add_list("hello")
puts $file_list