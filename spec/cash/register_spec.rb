require 'spec_helper'
require 'cash/register/pos'
require 'cash/register/goods'
require 'pry'

describe Cash::Register do

  let (:goods_info) { {
      "ITEM000001" => {"name" => "apple", "price" => 10},
      "ITEM000002" => {"name" => "banana", "price" => 6},
  } }
  let (:pos) { Pos.new }

  context "simple bill" do
    let (:bill) { ["ITEM000001", "ITEM000002"] }

    it 'should return the receipt which contains name and price' do
      receipt = pos.output(bill, goods_info)
      expect(receipt).to eql("名称：apple，数量：1，单价：10"+ "\n" + "名称：banana，数量：1，单价：6" + "\n")
    end
  end

  context "simple bill with mutiple format items" do
    let (:bill) { ["ITEM000001-2", "ITEM000002"] }

    it 'should return the receipt which contains amount' do
      receipt = pos.output(bill, goods_info)

      expect(receipt).to eql("名称：apple，数量：2，单价：10"+ "\n" + "名称：banana，数量：1，单价：6" + "\n")
    end
  end

end
