class Stock < ApplicationRecord
validates :content,{presence: true, length:{maximum:10} }
validates :stock_number,{presence: true}

def food
    return Food.find_by(stock_id: self.id)
end

end

