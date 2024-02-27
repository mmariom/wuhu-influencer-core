class Sellers::CompaniesController < ApplicationController
  def create
    @seller_company = SellerCompany.new(seller_company_params)
    @seller_company.save
    redirect_to dashboard_path
  end

  private
    def seller_company_params
      params.require(:seller_company).permit(:company_name, :company_reg_number, :street, :city, :postal_code, :country, :seller_id)
    end
end
