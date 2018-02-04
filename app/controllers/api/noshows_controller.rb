class Api::NoshowsController < BaseApiController


  def create
    #Check if current user was invited
    @noshow = Noshow.new(noshow_params)
    @noshow.participant_id = @current_participant.id
    attendance = Attendance.find_by(task_id: @noshow.task_id, participant_id: @current_participant.id)
    attendance.invitation_state = 2
    attendance.save
    if @noshow.save
      render json: @noshow
    end
  end

  def noshow_params
    params.require(:noshow).permit(:spotted, :task_id)
  end
end
