class BillParse

  def parse(bill, goods_info)
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