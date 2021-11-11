class Public::HomesController < ApplicationController
  def top
    @items = Item.all
  end

private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active )
  end

end
