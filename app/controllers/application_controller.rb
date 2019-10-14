class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!, only: [:show, :edit, :update, :delete, :index]
	before_action :correct_user, only: [:edit, :update]
  protected
  def after_sign_in_path_for(resource)
    user_path(@user)
  end
  def after_sign_up_path_for(resource)
    user_path(@user)
  end
  # def after_sign_out_path_for(resource)
  #   new_user_session_path # ログアウト後に遷移するpathを設定
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
