class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    if current_customer.cart_items.count == 0
      flash[:notice] = "商品がカートにありません。"
      redirect_to cart_items_path
    else
      render 'new'
    end

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
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
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
    	order_detail = OrderDetail.new
    	order_detail.order_id = @order.id
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
    params.require(:order).permit(:payment_method, :address, :postage, :postal_code, :name, :total_payment, :shipping_cost)
  end

end
