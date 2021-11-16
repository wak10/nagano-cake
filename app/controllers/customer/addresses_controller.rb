class Customer::AddressesController < ApplicationController
  def index
    @new_address = Address.new
    @addresses = Address.all
  end


  def create
    @addresses = Address.create(address_params)
    redirect_to addresses_path(@address)
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    @addresses = Address.find(params[:id])
    @addresses.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address )
  end

end
