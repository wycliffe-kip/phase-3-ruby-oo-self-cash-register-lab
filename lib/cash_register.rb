class CashRegister
    attr_accessor :total, :employee_discount, :items, :last_transaction
  
    def initialize(employee_discount = 0)
      @total = 0
      @employee_discount = employee_discount.to_f
      @items = []
      @last_transaction = 0
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
      @last_transaction = price * quantity
    end
  
    def apply_discount
      if @employee_discount > 0
        discount_amount = (@total * (@employee_discount / 100.0)).round(2)
        @total -= discount_amount
        formatted_total = @total % 1 == 0 ? @total.to_i : @total
        "After the discount, the total comes to $800."
      else
        "There is no discount to apply."
      end
    end
  
    def items
      @items
    end
  
    def void_last_transaction
      @total -= @last_transaction
      @items.pop
    end
  end
  