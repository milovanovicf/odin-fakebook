class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
