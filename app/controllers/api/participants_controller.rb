class Api::ParticipantsController < ActionController::Base

  def create
    @participant = Participant.new(participants_params)
    if @participant.save
      render json: @participant
    end
  end

  def participants_params
    params.require(:participant).permit(:email, :password, :gender, :role_id)
  end
end
