class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def edit
    @customer = current_customer
  end

  def update
    @customers = current_customer
    @customers.update(customer_params)
    redirect_to my_page_path
  end

  def show
    @customers = current_customer
  end

  def unsubscribe
  end



  def withdraw
    @customers = current_customer
    @customers.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit( :genre_id,:name,:image,:introduction,:price,:is_active )
  end

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active )
  end


end
