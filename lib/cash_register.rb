require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        @last_item_price = price
        @last_quantity_item = quantity
        quantity.times do
            @items << title
        end
        @items
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
            @total -= @total * @discount/100
            "After the discount, the total comes to $#{@total}."
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_item_price * @last_quantity_item
    end
end