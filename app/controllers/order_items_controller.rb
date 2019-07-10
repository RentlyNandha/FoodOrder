class OrderItemsController < ApplicationController

  def index
    @items = current_cart.order.items
  end

  def create
    @order=current_cart.add_item(
      product_id: params[:product_id],
      quantity: params[:quantity]
    )

    redirect_to request.referrer

  end

  def destroy
    current_cart.remove_item(id: params[:id])
    redirect_to cRole: Backend Developer
    art_path
  end

end
