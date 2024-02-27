# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_locale
  before_action :onboard_user
  
  def onboard_user
    # if seller_signed_in?
    #   redirect_to dashboard_path
    # end
  end

  def set_language
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
    redirect_to request.referrer || root_path
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
