# Carというクラスを作成
class Car
  @@class_name = "Car"
  
  def initialize
    @name = nil
  end

  def show()
    puts @name
  end

  def setName(str)
    @name = str
  end

  def self.getName()
    @@class_name
  end
end

# Carクラスのインスタンスを作成する
car = Car.new()
# Carの変数nameにセダンという文字列を設定する
car.setName("セダン")
# Carのメソッドであるshow()を実行
car.show()
# Carクラス内にあるクラス変数class_nameを表示
puts Car.getName()