class TaskRequirement < ApplicationRecord

  belongs_to :role
  belongs_to :task


  def create_attendances
    particpants = Participant.where(role_id: role.id)
  end

  def isNumberReached(timeslot)
    case timeslot
      when 1
        number <= timeslot1_acceptance
      when 2
        number <= timeslot2_acceptance
      when 3
        number <= timeslot3_acceptance
    end
  end

end
