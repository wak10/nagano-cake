class Customer::CartItemsController < ApplicationController


  def index
    @cart_items = CartItem.all
    # 合計算出のインスタンス
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to "/cart_items"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to "/cart_items"
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to "/cart_items"
  end

  def create
    # 同一商品があった場合
    if @cart_item = current_customer.cart_items.find_by(item_id:params[:cart_item][:item_id])
      @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)
    else
    # 同一商品がない場合
      @cart_items = current_customer.cart_items.build(cart_item_params)
      @cart_items.save
    end
      redirect_to  cart_items_path
  end


   private


  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount )
  end


end

