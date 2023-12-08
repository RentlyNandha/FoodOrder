# app/controllers/deliveries_controller.rb
class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.includes(:delivery_man)
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to deliveries_path
    else
      flash[:error] = "error occured"
      render :new
    end
  end

  private
  def delivery_params
    params.permit(:feedback, :status)
  end
end
