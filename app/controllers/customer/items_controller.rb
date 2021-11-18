class Customer::ItemsController < ApplicationController
  def index
    @all_items = Item.all
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @items = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active )
  end
end
