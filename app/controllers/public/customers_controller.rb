class Public::CustomersController < ApplicationController
  def edit
    @customers = Customer.find(params[:id])
  end

  def update
  end

  def show
    @customers = Customer.find(params[:id])
    @items = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active )
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :orders, :telephone_number, :email, :is_active )
  end

end
