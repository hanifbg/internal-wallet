class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session
  before_action :require_login

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authorize!(record)
    render json: { error: "Not Authorized" }, status: :forbidden unless record.walletable == current_user
  end

  private

  def require_login
    unless current_user
      render json: { error: "You must be login first" }, status: :unauthorized
    end
  end
end
