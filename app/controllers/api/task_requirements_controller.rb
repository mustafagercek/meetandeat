class Api::TaskRequirementsController < BaseApiController

  def index
    @task_requirements = TaskRequirement.where(participant_id: @current_participant.id)
    render json: @task_requirements, except: %i[created_at updated_at]
  end

end
