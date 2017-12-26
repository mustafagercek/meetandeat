class Attendance < ApplicationRecord
  belongs_to :task
  belongs_to :participant

  enum query_state: %i[pending notified answered]
  enum invitation_state: %i[invited rejected]

end
