class Task < ApplicationRecord
  before_save :set_state, unless: :survey_state

  has_many :attendances
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
      1
    else
      2
    end
  end
end
