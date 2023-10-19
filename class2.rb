# class Human
#   # ⇩クラス変数を定義。変数名の頭に@@をつけるルール有
#   @@class_name = "Human"

#   def initialize
#     # ⇩インスタンス変数を定義。変数名の頭に@と付けるルール有
#     @name = "大泉"
#   end

#   def show()
#     puts @name
#   end
# end 

#演習1
class Hoge
  def hello
    puts "Hello Rudy!"
  end
end
hoge = Hoge.new()
hoge.hello()

