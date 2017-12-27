class Task < ApplicationRecord
  before_save :set_state, unless: :survey_state

  has_many :attendances
  has_many :task_requirements
  has_many :roles, through: :task_requirements
  enum survey_state: %i[created active finished]

  def set_state
    puts title + ', Old State: ' + survey_state if survey_state
    self.survey_state = check_state
    puts title + ', New State: ' + survey_state
  end

  def check_state
    if survey_start > Time.now
      0
    elsif (survey_start..self.survey_end).cover?(Time.now)
      puts 'starting algorithm'
      create_attendances
      1
    else
      2
      invite_people
    end
  end

  def create_attendances
    participants = Participant.all
    participants.each do |participant|
      Attendance.find_or_create_by(participant_id: participant.id, task_id: id, query_state: 0)
    end
  end

  def invite_people
    is_finished = false
    winningTimeslot = 0
    i = 1
    num = 3
    while i <= num
      number_of_reaches = 0
      task.task_requirements.each do |task_requirement|
        number_of_reaches += (task_requirement.isNumberReached(i) ? 1 : 0)
      end
      is_finished = number_of_reaches == task.task_requirements.length
      winningTimeslot = i if is_finished
      break if is_finished
      i += 1
    end

    if is_finished
      self.winning_timeslot = winningTimeslot
      self.save
      invitations = []
      case winningTimeslot
        when 1

          all_attendances = Attendance.includes(participant: :preferences)
                                .where(task_id: task.id, timeslot1: true)
          all_attendances.each do |attendant|
            attendant.invitation_state = 1
            attendant.save
          end

          task.task_requirements.each do |task_requirement|
            invitations += Attendance.includes(participant: :preferences)
                               .where(task_id: task.id, query_state: 2, timeslot1: true,
                                      participants: {role_id: task_requirement.role_id, preferences: {kitchen_id: task.kitchen_id}})
                               .order('preferences.rating DESC')
                               .limit(task_requirement.number)

          end
        when 2
          all_attendances = Attendance.includes(participant: :preferences)
                                .where(task_id: task.id, timeslot2: true)
          all_attendances.each do |attendant|
            attendant.invitation_state = 1
            attendant.save
          end

          task.task_requirements.each do |task_requirement|
            invitations += Attendance.includes(participant: :preferences)
                               .where(task_id: task.id, query_state: 2, timeslot2: true,
                                      participants: {role_id: task_requirement.role_id, preferences: {kitchen_id: task.kitchen_id}})
                               .order('preferences.rating DESC')
                               .limit(task_requirement.number)

          end
        when 3
          all_attendances = Attendance.includes(participant: :preferences)
                                .where(task_id: task.id, timeslot3: true)
          all_attendances.each do |attendant|
            attendant.invitation_state = 1
            attendant.save
          end
          task.task_requirements.each do |task_requirement|
            invitations += Attendance.includes(participant: :preferences)
                               .where(task_id: task.id, query_state: 2, timeslot3: true,
                                      participants: {role_id: task_requirement.role_id, preferences: {kitchen_id: task.kitchen_id}})
                               .order('preferences.rating DESC')
                               .limit(task_requirement.number)
          end
      end
      invitations.each do |attendant|
        attendant.invitation_state = 0
        attendant.save
      end


    else
      self.winning_timeslot = -1
      self.save
    end
  end

end
