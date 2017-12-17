class Attendance < ApplicationRecord
  belongs_to :task
  belongs_to :participant
end
