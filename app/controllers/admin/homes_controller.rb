class Admin::HomesController < ApplicationController
  def top
    @sum_amount = 0
    @orders = Order.page(params[:page]).per(10)
  end
end
