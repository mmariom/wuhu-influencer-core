# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    before_action :set_locale

    protect_from_forgery with: :null_session

  
    # def set_language
    #   locale = params[:locale].to_s.strip.to_sym
    #   Rails.logger.debug "Attempting to set language to #{locale}"

    #   if I18n.available_locales.include?(locale)
    #     session[:locale] = locale
    #     flash[:notice] = "Language changed to #{locale}"
    #   else
    #     flash[:alert] = "Language not supported."
    #   end
    #   redirect_to request.referrer || root_url
    # end
    
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
  