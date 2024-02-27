# frozen_string_literal: true

class Sellers::RegistrationsController < Devise::RegistrationsController
  include Wicked::Wizard
  steps :validate_otp, :address, :company

  def new
    build_resource
    yield resource if block_given?
    render layout: 'auth'
   end

  def after_sign_up_path_for(resource)
    wizard_path(:validate_otp)
  end

  def after_inactive_sign_up_path_for(resource)
    @@seller = resource
    wizard_path(:validate_otp)
  end

  def show
    case params[:id]
    when "validate_otp"
      @seller ||= @@seller
    when "address"
      @seller_address = current_seller.seller_address.present? ? current_seller.seller_address : SellerAddress.new
    when "company"
      @seller_company = SellerCompany.new
    end
    render_wizard
  end
end
