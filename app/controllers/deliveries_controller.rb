# app/controllers/deliveries_controller.rb
class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.includes(:delivery_man)
  end
end
