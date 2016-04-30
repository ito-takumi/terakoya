class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_params
  before_action :set_locale

private
  def check_params
    [:notice, :alert, :error].each do |type|
      flash.now[type] = params[type]
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
