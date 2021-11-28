class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:id])
    @order.order_details.update(order_detail_params)
    redirect_to admin_order_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status, :created_at, :updated_at )
  end
end
