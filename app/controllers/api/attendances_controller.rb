class Api::AttendancesController < BaseApiController

  def index
    @attendances = Attendance.includes(:task).where(participant_id: @current_participant.id).where.not(query_state: 0)
    render json: @attendances, include: {task: {include: {task_requirements: {only: %i[number]}, kitchen: {}}, except: %i[created_at updated_at algorithm current_levelgit add]}},
           except: %i[created_at updated_at], status: 200
  end

  def create
    @attendance = Attendance.new(attendances_params)
    if @attendance.save
      render json: @attendance, status: 200
    end
  end

  def update
    @attendance = Attendance.find params[:id]
    if @attendance.query_state == 1
      @attendance.query_state = 2
      if @attendance.update attendances_params
        task_requirement = TaskRequirement.find_by(task_id: @attendance.task.id, role_id: @current_participant.role_id)
        if @attendance.timeslot1
          task_requirement.timeslot1_acceptance += 1
          task_requirement.save

        end
        if @attendance.timeslot2
          task_requirement.timeslot2_acceptance += 1
          task_requirement.save

        end
        if @attendance.timeslot3
          task_requirement.timeslot3_acceptance += 1
          task_requirement.save
        end
      end
      render json: @attendance, status: 200
    end
  else
    render json: {}, status: 400
  end

  def attendances_params
    params.require(:attendance).permit(:timeslot1, :timeslot2, :timeslot3)
  end
end
