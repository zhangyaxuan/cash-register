class Item
  attr_accessor :name, :amount, :price, :cost

  def initialize(name, amount, price, cost)
    @name = name
    @amount = amount
    @price = price
    @cost = cost
  end
end