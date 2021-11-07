class Admin::HomesController < ApplicationController
  def top
    @orders = order.all
  end
end
