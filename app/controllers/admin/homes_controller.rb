class Admin::HomesController < ApplicationController
  def top
    @sum_amount = 0
    @orders = Order.order(created_at: :desc).page(params[:page]).per(10)
  end
end
