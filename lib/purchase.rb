class Purchase < ActiveRecord::Base
  belongs_to(:product)
  belongs_to(:cashier)
end

