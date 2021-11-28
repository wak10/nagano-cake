class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to action: :show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :carrage, :total_payment, :payment_method, :status, :created_at, :updated_at )
  end


end
