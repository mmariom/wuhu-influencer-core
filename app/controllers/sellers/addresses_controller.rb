class Sellers::AddressesController < ApplicationController
  include Wicked::Wizard
  steps :validate_otp, :address, :company

  def create
    @seller_address = SellerAddress.new(seller_address_params)
    redirect_to wizard_path(:company) if @seller_address.save
  end

  def update
    @seller_address = SellerAddress.find(params[:identification_number])
    redirect_to wizard_path(:company) if @seller_address.update(seller_address_params)
  end

  private
    def seller_address_params
      params.require(:seller_address).permit(:street, :city, :postal_code, :country, :seller_id)
    end
end
