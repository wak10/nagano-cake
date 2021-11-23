class Customer::AddressesController < ApplicationController
  def index
    @new_address = Address.new
    @addresses = current_customer.addresses
  end


  def create
    @new_address = Address.new(address_params)
    @new_address.customer_id = current_customer.id
    @new_address.save
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
