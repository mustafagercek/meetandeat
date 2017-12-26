class Preference < ApplicationRecord
  include Filterable
  belongs_to :participant
  belongs_to :kitchen
end
