
require 'pry'
class CashRegister
  
  attr_accessor :discount, :total, :price
  
  def initialize(discount=0)
    @total = 0.00
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity=1)
    sub_total = price.to_f * quantity.to_f
    self.total += sub_total
    @items.fill(title, @items.length, quantity)
    self.price = price * quantity
    #binding.pry
  end

  def apply_discount
    if @discount != 0
      @total *= 0.8
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total -= @price
  end
  
end
