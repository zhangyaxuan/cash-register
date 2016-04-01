
class Calculator
  def calculate item_list
    total_cost = 0
    item_list.each { |item|
      total_cost += item.cost
    }
    total_cost
  end
end