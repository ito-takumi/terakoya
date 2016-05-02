class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    flash[:notice] = "login"
    super
  end

  # DELETE /resource/sign_out
  def destroy
    flash[:notice] = "logout"
    super
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in,
      keys: [:login_id, :password, :remember_me]
    )
  end
end
