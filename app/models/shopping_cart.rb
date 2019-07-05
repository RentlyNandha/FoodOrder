class ShoppingCart
 
  def initialize(token:,uid:)
    @token = token
    @uid = uid
  end
  delegate:sub_total,to: :order

  def order
    @order ||= Order.find_or_create_by(token: @token) do |order|
      order.sub_total = 0
      order.user_id=@uid
      order.status="Cart"
    end
  end

  def items_count
    order.items.sum(:quantity)
  end

  def add_item(product_id:, quantity: 0)
    
    product = Product.find(product_id)

    order_item = order.items.find_or_initialize_by(
      product_id: product_id
    )
  if quantity.to_i>=1
    order_item.price = product.price
    order_item.quantity = quantity
    order.sub_total+=order_item.quantity*order_item.price
    order.save
    order_item.save
  end
end
  def remove_item(id:)
    o=order.items.find(id)
    order.sub_total-=o.quantity*o.price
    order.save
    o.destroy
  end

end
