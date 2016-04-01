require 'cash/register/models/goods'
require 'cash/register/models/item'
require 'cash/register/bill_parse'

class Pos

  def initialize goods_info
    @goods_info = goods_info
  end

  def printReceipt bill
    printHeader
    printBody bill
    printFooter
  end

  def printBody(bill)
    item_list = BillParse.new.parse(bill, @goods_info)
    printItemList(item_list)
  end

  def printItemList(item_list)
    result = ""
    item_list.each { |item|
      result += "名称：#{item.name}，数量：#{item.amount}，单价：#{item.price}(元)，小计：#{item.cost}(元)" + "\n"
    }
    result
  end

  def printHeader
    "***<没钱赚商店>购物清单***"
  end

  def printFooter
    "**********************"
  end
end