class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  #before_action :current_user, :require_login

  def check
    if user = Participant.valid_login?(params[:email], params[:password])
      render json: user
    else
      render_unauthorized("Access denied")
    end
  end

end
