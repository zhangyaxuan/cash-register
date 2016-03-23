require 'spec_helper'
require 'cash/register/pos'
require 'cash/register/models/goods'
require 'pry'

describe Cash::Register do

  let (:goods_info) { {
      "ITEM000001" => {"name" => "apple", "price" => 10},
      "ITEM000002" => {"name" => "banana", "price" => 6},
  } }
  let (:pos) { Pos.new }

  context "simple bill with mutiple format items" do
    let (:bill) { ["ITEM000001-2", "ITEM000002"] }

    it 'should return the receipt which contains amount' do
      receipt = pos.printReceipt(bill, goods_info)

      expect(receipt).to eql( "***<没钱赚商店>购物清单***" + "\n"  +
                            "名称：apple，数量：2，单价：10(元)，小计：20(元)"+ "\n" + "名称：banana，数量：1，单价：6(元)，小计：6(元)" + "\n" +
                             "总计: 26(元)" + "\n" +
                            "**********************")
    end
  end

end
