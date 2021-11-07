class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all

  end

  def create
    @item = Item.create(item_params)
    redirect_to admin_item_path(:id)
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active )
  end

end
