class Customer::OrdersController < ApplicationController

  def new
    @orders = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
     @sum = 0
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = CartItem.all


    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.item_id = cart_item.item.id
      @order_details.save
    end
    @cart_items.destroy_all
    redirect_to complete_orders_path

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :carrage )
  end
end
