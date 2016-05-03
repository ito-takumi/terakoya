class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_application_title
  before_action :set_locale

  include Common::DeviseSessionUtil
  include Common::I18nUtil

  protected

  def set_application_title
    @application_head_title = @application_title = "Terakoya"
    unless Rails.env.production?
      @application_head_title = "[DEV] #{@application_head_title}"
    end
  end
end
