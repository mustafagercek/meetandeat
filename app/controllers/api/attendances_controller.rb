class Api::AttendancesController < BaseApiController

  def index
    @attendances = Attendance.includes(:task).where(participant_id: @current_participant.id).where.not(query_state: 0)
    render json: @attendances, include: {task: {except: %i[created_at updated_at algorithm current_levelgit add]}},
           except: %i[created_at updated_at]
  end

  def create
    @attendance = Attendance.new(attendances_params)
    if @attendance.save
      render json: @attendance
    end
  end

  def attendances_params
    params.require(:attendance).permit(:participant, :task)
  end
end
