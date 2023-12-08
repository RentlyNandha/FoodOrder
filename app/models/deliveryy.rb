# app/models/delivery.rb
class Delivery < ApplicationRecord
  belongs_to :delivery_man, optional: true

  def deliver!
    # Perform delivery logic
    update(status: 'in_progress')
  end

  def cancel_delivery
    update(status: 'cancelled')
  end

  def order_name
    # Assuming the order has a name attribute
    order.name
  end
end
