class Task < ApplicationRecord
  before_save :set_state, unless: :survey_state

  has_many :attendances
  has_many :task_requirements
  has_many :roles, through: :task_requirements

  has_many :noshows
  enum survey_state: %i[created started finished]

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
      case algorithm
        when 0
          notify_every_user unless survey_state == 'started'
        when 1
          create_attendances unless survey_state == 'started'
      end
      1
    else
      invite_people
      2
    end
  end

  def notify_every_user
    puts 'Creating attendances'
    participants = Participant.all
    user_firebase_ids = []
    participants.each do |participant|
      attendances << Attendance.new(participant_id: participant.id, query_state: 1)
      user_firebase_ids << participant.firebase_token if participant.firebase_token.present?
    end
    FirebaseCloudMessaging::UserNotificationSender.new(user_firebase_ids, 'You have a new invitation').call
  end

  def create_attendances
    puts 'Creating attendances'
    participants = Participant.all
    participants.each do |participant|
      attendances << Attendance.new(participant_id: participant.id, query_state: 0)
    end
  end

  def invite_people
    is_finished = false
    winningTimeslot = 0
    i = 1
    num = 3
    while i <= num
      number_of_reaches = 0
      task_requirements.each do |task_requirement|
        number_of_reaches += (task_requirement.isNumberReached(i) ? 1 : 0)
      end
      is_finished = number_of_reaches == task_requirements.length && number_of_reaches!=0
      winningTimeslot = i if is_finished
      break if is_finished
      i += 1
    end

    if is_finished
      self.winning_timeslot = winningTimeslot
      invitations = []
      case winningTimeslot
        when 1

          all_attendances = Attendance.includes(participant: :preferences)
                                .where(task_id: id, timeslot1: true)
          all_attendances.each do |attendant|
            attendant.invitation_state = 0
            attendant.save
          end

          task_requirements.each do |task_requirement|
            invitations += Attendance.includes(participant: :preferences)
                               .where(task_id: id, query_state: 2, timeslot1: true,
                                      participants: {role_id: task_requirement.role_id, preferences: {kitchen_id: kitchen_id}})
                               .order('preferences.rating DESC')
                               .limit(task_requirement.number)

          end
        when 2
          all_attendances = Attendance.includes(participant: :preferences)
                                .where(task_id: id, timeslot2: true)
          all_attendances.each do |attendant|
            attendant.invitation_state = 0
            attendant.save
          end

          task_requirements.each do |task_requirement|
            invitations += Attendance.includes(participant: :preferences)
                               .where(task_id: id, query_state: 2, timeslot2: true,
                                      participants: {role_id: task_requirement.role_id, preferences: {kitchen_id: kitchen_id}})
                               .order('preferences.rating DESC')
                               .limit(task_requirement.number)

          end
        when 3
          all_attendances = Attendance.includes(participant: :preferences)
                                .where(task_id: id, timeslot3: true)
          all_attendances.each do |attendant|

            attendant.invitation_state = 0
            attendant.save
          end
          task_requirements.each do |task_requirement|
            invitations += Attendance.includes(participant: :preferences)
                               .where(task_id: id, query_state: 2, timeslot3: true,
                                      participants: {role_id: task_requirement.role_id, preferences: {kitchen_id: kitchen_id}})
                               .order('preferences.rating DESC')
                               .limit(task_requirement.number)
          end
      end
      invitations.each do |attendant|
        attendant.invitation_state = 1
        #TODO SHOWUPN
        attendant.save
      end


    else
      self.winning_timeslot = -1
    end
    user_firebase_ids = []
    all_notified_users = Attendance.where(task_id: id).where.not(query_state: 0)
    all_notified_users.each do |attendant|
      user_firebase_ids << attendant.participant.firebase_token if attendant.participant.firebase_token.present?
    end
    FirebaseCloudMessaging::UserNotificationSender.new(user_firebase_ids, 'The query you were invited to just ended! Check out the result').call if user_firebase_ids.any?
  end

end
