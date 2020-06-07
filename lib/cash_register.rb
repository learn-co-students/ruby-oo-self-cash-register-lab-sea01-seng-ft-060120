require 'pry'
class CashRegister
    
    attr_accessor :total, :items
    attr_reader :discount


    def initialize(discount=0.0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end

    def add_item (title, price, quantity=1)
        @last_transaction = {price: price, quantity: quantity}
        quantity.times do 
            @items << title
        end
        @total += (price * quantity)
    end

    def apply_discount
        @total -= (@discount.to_f/100 * @total)
        if @discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def items
       @items
    end

    def void_last_transaction
        @total -= (@last_transaction[:price] * @last_transaction[:quantity])
    end
end
