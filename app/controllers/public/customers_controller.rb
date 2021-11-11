class Public::CustomersController < ApplicationController
  def edit
    @items = Item.find(params[:id])
  end
  
  def update
  end
  
  def show
  end
  
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active )
  end
end
