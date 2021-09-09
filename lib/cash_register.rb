require "pry"

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times {self.items << title}
        self.last_transaction = price * quantity
    end

    def apply_discount 
        if discount > 0 
            @total = self.total - (self.total * (self.discount/100.0))
            "After the discount, the total comes to $#{self.total.round}."
        else
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        self.total -= self.last_transaction
    end


end
