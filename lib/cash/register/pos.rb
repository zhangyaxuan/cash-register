class Pos

  def output(bill, goods_info)

    result = ""

    for item in bill
      item_amount = item.split("-")
      if item_amount[1].nil?
        item_amount[1] = 1
      end

      goods = goods_info[item_amount[0]]

      cost = calculateMoney(goods["price"], item_amount[1])

      result += "名称：#{goods["name"]}，数量：#{item_amount[1]}，单价：#{goods["price"]}(元)，小计：#{cost}(元)" + "\n"
    end

    result
  end

  def calculateMoney(price, amount)
    price.to_i * amount.to_i
  end
end