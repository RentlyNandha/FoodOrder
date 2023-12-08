# app/models/delivery_man.rb
class DeliveryMan < ApplicationRecord
  has_many :deliveries

  def assign_delivery(delivery)
    delivery.update(delivery_man_id: id)
  end

  def complete_delivery(delivery)
    delivery.update(status: 'delivered')
  end

  def pending_deliveries
    deliveries.where(status: 'pending')
  end
end
