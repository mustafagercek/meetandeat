class Api::ParticipantsController < ActionController::Base

  def create
    @participant = Participant.new(participants_params)
    if @participant.save
      render json: @participant, status: 200
    end
  end

  def update
    @participant = Participant.find params[:id]
    @participant.update participants_params
    render json: @participant, status: 200

  end

  def participants_params
    params.require(:participant).permit(:email, :password, :gender, :role_id,
                                        :firebase_token)
  end
end
