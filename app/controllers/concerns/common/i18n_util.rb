module Common::I18nUtil
  protected

  def set_locale
    I18n.locale = session[:locale] = locale
  end

  def locale
    params[:locale] || session[:locale] || I18n.default_locale
  end
end