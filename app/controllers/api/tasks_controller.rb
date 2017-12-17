class Api::TasksController < BaseApiController

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def task_params
    params.require(:task).permit(:title, :address, :timeslot1, :timeslot2, :timeslot3, :description,
                                 :incentive, :participantslot1, :participantslot2, :participantslot3, :status)
  end

end
