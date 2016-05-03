module Common::DeviseSessionUtil
  protected

  def after_sign_in_path_for(resource)
    stored_location_for(:user) || root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end