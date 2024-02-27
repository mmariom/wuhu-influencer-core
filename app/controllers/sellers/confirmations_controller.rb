# frozen_string_literal: true

class Sellers::ConfirmationsController < Devise::ConfirmationsController
  include Wicked::Wizard
  steps :validate_otp, :address, :company

  protected
    def after_confirmation_path_for(resource_name, resource)
      sign_in(resource)
      wizard_path(:address)
    end
end
