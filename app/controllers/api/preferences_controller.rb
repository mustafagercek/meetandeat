class Api::PreferencesController < BaseApiController

  def index
    @preferences = Preference.includes(:kitchen).where(participant_id: @current_participant.id, kitchens: { active: true })
    render json: @preferences, include: {kitchen: {except: %i[created_at updated_at]}},
           except: %i[created_at updated_at]
  end

  def create
    @participant = Participant.new(participants_params)
    if @participant.save
      render json: @participant
    end
  end

  def update
    @participant = Participant.find params[:id]
    @participant.update participants_params

  end

  def participants_params
    params.require(:participant).permit(:email, :password)
  end
end
