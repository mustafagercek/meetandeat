class SurveyAnswer < ApplicationRecord
  belongs_to :survey_item
  belongs_to :participant
end
