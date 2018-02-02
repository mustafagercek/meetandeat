class SurveyRequest < ApplicationRecord
  belongs_to :survey
  belongs_to :participant
end
