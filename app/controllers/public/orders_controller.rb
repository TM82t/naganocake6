class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @total = 0
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def complete
    order = Order.new(session[:order])
    order.save

    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
    	order_detail = OrderDetail.new
    	order_detail.order_id = order.id
    	order_detail.item_id = cart_item.item.id
    	order_detail.amount = cart_item.amount
    	order_detail.price = cart_item.item.with_tax_price
    	order_detail.save
    end

    cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postage, :postal_code, :name, :total_fee)
  end

end
