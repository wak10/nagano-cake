class Customer::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end


  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active )
  end
end
