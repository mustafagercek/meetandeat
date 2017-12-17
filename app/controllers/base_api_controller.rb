class BaseApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :do_auth

  def do_auth
    if current_participant
    else
      render_unauthorized("Access denied")
    end
  end

  def render_unauthorized(message)
    errors = {errors: [{detail: message}]}
    render json: errors, status: :unauthorized
  end

  def current_participant
    @current_participant = Participant.where(auth_token: request.headers['HTTP_TOKEN']).first
  end

end
