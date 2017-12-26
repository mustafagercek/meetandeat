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
      #Determine winning timeslot with most promising result
      #Create in

      ##einladung verschicken
    end
  end

  def create_attendances
    participants = Participant.all
    participants.each do |participant|
      Attendance.find_or_create_by(participant_id: participant.id, task_id: id, query_state: 0)
    end
  end

end
