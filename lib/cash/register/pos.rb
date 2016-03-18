class Pos

  def output(bill, goods_info)

    result = ""

    for item in bill
      item_amount = item.split("-")
      if item_amount[1].nil?
        item_amount[1] = 1
      end

      goods = goods_info[item_amount[0]]
      result += "名称：" + goods["name"]+"，数量：#{item_amount[1]}，单价：#{goods["price"]}" + "\n"
    end

    result
  end
end