class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @orders = Order.new
    @customers = current_customer
    
    # newのview表示ができない、ここからスタート11/21
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

end
