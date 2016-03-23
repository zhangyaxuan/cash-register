require 'cash/register/models/goods'
require 'cash/register/models/item'

class Pos
  HEADER = "***<没钱赚商店>购物清单***"
  FOOTER = "**********************"

  def printReceipt(bill, goods_info)
    item_list = parseBill(bill, goods_info)

    result = HEADER + "\n"
    money=0
    item_list.each {|item|
         result += "名称：#{item.name}，数量：#{item.amount}，单价：#{item.price}(元)，小计：#{item.cost}(元)" + "\n"
      money += item.cost
    }
    result += "总计: #{money}(元)" + "\n"
    result += FOOTER

  end

  def parseBill(bill, goods_info)
    item_list = []

    for line in bill
      item_amount = line.split("-")
      getAmount(item_amount)

      goods = goods_info[item_amount[0]]
      cost = calculateMoney(goods["price"], item_amount[1])
      item_list << Item.new(goods["name"], item_amount[1], goods["price"], cost)
    end
    item_list
  end

  def getAmount(item_amount)
    if item_amount[1].nil?
      item_amount[1] = 1
    end
  end

  def calculateMoney(price, amount)
    price.to_i * amount.to_i
  end
end