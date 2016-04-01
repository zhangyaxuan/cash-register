require 'rspec'
require 'cash/register/models/calculator'
require 'cash/register/models/item'

describe 'Calculator' do
  let (:item1) {Item.new("name1", 1, 10, 10)}
  let (:item_list) do
    item1 = Item.new("name1", 1, 10, 10)
    [] << item1
  end
  it 'should calculate total cost' do
    total_cost = Calculator.new.calculate(item_list)
    expect(total_cost).to eql(10)
  end
end