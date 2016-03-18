require 'spec_helper'
require 'cash/register/pos'
require 'cash/register/goods'

describe Cash::Register do

  let (:bill) {["ITEM000001", "ITEM000002"]}
  let (:goods_info) {{
      "ITEM000001" => {"name" => "apple", "price" => 10},
      "ITEM000002" => {"name" => "banana", "price" => 6},
  }}
  let (:pos) {Pos.new}

  it 'should return the receipt which contains name and price' do
    receipt = pos.output(bill, goods_info)
    expect(receipt).to eql("名称：apple，数量：1，单价：10"+ "\n" + "名称：banana，数量：1，单价：6" + "\n" )
  end

end
