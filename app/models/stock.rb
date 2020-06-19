class Stock < ApplicationRecord
validates :content,{presence: true, uniqueness: true, length:{maximum:10} }
validates :stock_number,{presence: true}
end
