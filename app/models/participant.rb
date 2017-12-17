class Participant < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token

  has_many :attendances

  enum gender: [:male, :female]
  enum role: [:business_administration, :business_informatics, :other]

  def self.valid_login?(email, password)
    participant = find_by(email: email)
    if participant && participant.authenticate(password)
      participant
    end
  end
end
