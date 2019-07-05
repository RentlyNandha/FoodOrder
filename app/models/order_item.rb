class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
 # validates_numericality_of :quantity, :allow_nil => true, :greater_than_or_equal_to => 0
end
