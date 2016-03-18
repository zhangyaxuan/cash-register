class Pos

  def output(bill, goods_info)
    result = ""
    for item in bill
      goods = goods_info[item]
      result += "名称：" + goods["name"]+"，数量：1，单价："+ goods["price"].to_s + "\n"
    end

    result
  end
end