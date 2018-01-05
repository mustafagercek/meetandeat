class Participant < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  after_create :set_default_prefs

  has_many :attendances
  has_many :preferences

  belongs_to :role, optional: true

  enum role: [:business_administration, :business_informatics, :other]

  def self.valid_login?(email, password)
    participant = find_by(email: email)
    if participant && participant.authenticate(password)
      participant
    end
  end

  def set_default_prefs
    kitchens = Kitchen.all
    kitchens.each {|kitchen| Preference.create(participant: self, kitchen: kitchen, rating: 3)}
  end

end
