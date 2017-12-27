class Api::PreferencesController < BaseApiController

  def index
    @preferences = Preference.includes(:kitchen).where(participant_id: @current_participant.id, kitchens: { active: true })
    render json: @preferences, include: {kitchen: {except: %i[created_at updated_at]}, participant: {}},
           except: %i[created_at updated_at]
  end

  def create
    @participant = Participant.new(participants_params)
    if @participant.save
      render json: @participant
    end
  end

  def update
    @preference = Preference.find params[:id]
    @preference.update preferences_params

  end

  def preferences_params
    params.require(:preference).permit(:participant, :kitchen, :rating)
  end
end
