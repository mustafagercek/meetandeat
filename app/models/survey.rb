class Survey < ApplicationRecord

  belongs_to :task
  has_many :survey_items


end
