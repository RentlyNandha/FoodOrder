class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :current_cart
  

  def current_cart
    if current_user!=nil
    @current_cart ||= ShoppingCart.new(token: cart_token,uid: current_user.id)
    #@current_cart.uid=current_user.id
    end
  end
  helper_method :current_cart

  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end
end
