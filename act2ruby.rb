
# PROBLEM 1
class Laptop
  def initialize(brand, model) # to init but ruby
    @brand = brand
    @model = model
  end

  def brand # custom getter for brand
    @brand
  end

  def model # custom getter for model
    @model
  end

end

# tests
laptop = Laptop.new("Lenovo", "Thinkpad")
puts laptop.brand
puts laptop.model


# PROBLEM 2
class Gadget
  attr_reader :name
  attr_writer :price

  def initialize(name, price) # init with name and price
    @name = name
    @price = price
  end

end

# tests
bottle = Gadget.new("YETI Waterbottle", 35.99) # new gadget
puts bottle.name # puts name "YETI blah blah"
bottle.price = 45.99 # updates price


# PROBLEM 3
class User
  def initialize(username)
    self.username = username # uses custom setter
  end

  def username=(username)
    raise ArgumentError, "User may not be empty or nil." if username.nil? || username.empty? # raises error if empty or nil
    @username = username
  end

end

# tests
user = User.new("cprster2") # new username
puts user.instance_variable_get("@username") # puts cprster2


# PROBLEM 4
class Appliance
  def show_info
    puts "This is a household appliance." # will always print for show_info
  end
end

class Refrigerator < Appliance # inherit from refrigerator
  def type
    puts "This is a Samsung Smart Refrigerator! It offers tremendous space, a clean design, the ability to control your fridge remotely, and even a smart screen!" # extra details on top of household appliance
  end
end

class Microwave < Appliance
  def type
    puts "This is a KitchenAid 2.1 Microwave! It offers a slim design as well as convection cooking, grilling, and even a defroster!"
  end
end

# tests
fridge = Refrigerator.new
fridge.show_info # outputs household appliance
fridge.type # outputs details of appliance

micro = Microwave.new
micro.show_info
micro.type


# PROBLEM 5
module Payments
  class Invoice ; end
  class Receipt ; end
end

# tests
invoice = Payments::Invoice.new
receipt = Payments::Receipt.new

puts invoice.class # prints above statement for both
puts receipt.class


# PROBLEM 6
module Drivable
  def drive
    puts "Vroom Vroom"
  end
end

class Car
  include Drivable # includes drive from module Drivable
end

class Truck
  include Drivable # also includes drive
end

# tests
car = Car.new
truck = Truck.new
car.drive # outputs "Vroom Vroom"
truck.drive


# PROBLEM 7
class Writer
  def create
    "List of writers" # array of writers
  end
end

class Painter
  def create
    "List of painters" # array of painters
  end
end

def showcase_talent(artists)
  artists.each(&:create)
end

# tests
showcase_talent([Writer.new, Painter.new]) # outputs array for both

# PROBLEM 8
class BankAccount
  def deposit(amount)
    log_transaction("Deposit: ", amount) # deposit format
  end

  def withdraw(amount)
    log_transaction("Withdraw: ", amount) # withdraw format
  end

  private

  def log_transaction(type, amount)
    puts "#{type} $#{amount} from/to account." # shows transaction type and value
  end

end

# tests
balance = BankAccount.new
balance.deposit(15000)
balance.withdraw(250)

# PROBLEM 9
class Camera
  def turn_on
    self.status = "on" # creates status
    puts "Canon EOS T7 is #{status}" # status message
  end

  def turn_off
    self.status = "off"
    puts "Canon EOS T7 is #{status}"
  end

  private

  attr_accessor :status

end

# tests
canon = Camera.new
canon.turn_on # outputs on status
canon.turn_off # outputs off status

# PROBLEM 10
class Quiz
  def initialize
    q_methods
  end

  private

  def q_methods
    ['math', 'history'].each do |topic|
      self.class.define_method("question_about_#{topic}") do # selects topic with define method
        puts "In #{topic}, what is a derivative?" # i couldnt figure this part out in a way that worked :( )
        puts "In #{topic}, what year did WW2 end?"
      end
    end
  end
end

question = Quiz.new
question.question_about_math # outputs math question
question.question_about_history # outputs history question
