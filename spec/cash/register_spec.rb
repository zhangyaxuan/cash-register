require 'spec_helper'
require 'cash/register/pos'
require 'cash/register/goods'

describe Cash::Register do

  let (:bill) {"ITEM000001"}
  let (:goods_info) {Goods.new("ITEM000001", "apple", 10)}
  let (:pos) {Pos.new}

  it 'should return the receipt which contains name and price' do
    receipt = pos.output(bill, goods_info)
    expect(receipt).to eql("名称：apple，数量：1，单价：10，小计：10")
  end

end
