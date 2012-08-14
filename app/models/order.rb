class Order < ActiveRecord::Base
  attr_accessible :customer_id, :price
  belongs_to :customer

  def price_string
    reformat_price(self.price)
  end

  def reformat_price(price)
    price_string = price.to_s
    chars_after_decimal = nil;
    count_chars = false;
    
    price_string.each_char do |c|
      if c.to_s == '.'
        count_chars = true;
        chars_after_decimal = 0;
      elsif count_chars == true
        chars_after_decimal += 1;
      end
    end

    if chars_after_decimal == 1
      price_string += '0'
    elsif chars_after_decimal > 2
      chars_to_delete = chars_after_decimal - 2
      temp_price = price_string.reverse
      temp_price.slice!(0..chars_to_delete-1)
      price_string = temp_price.reverse
    end
    price_string
  end

end
