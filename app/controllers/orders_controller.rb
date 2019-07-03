class OrdersController < ApplicationController
    def create
        @order=current_cart.order
        session[:cart_token]=nil
        redirect_to root_path
    end
end
