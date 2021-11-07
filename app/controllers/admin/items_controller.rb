class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all

  end

  def create
    @item = Item.create(item_params)
    redirect_to admin_item_path(@item.id)

  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.create(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction, :price, :is_active )
  end

end
