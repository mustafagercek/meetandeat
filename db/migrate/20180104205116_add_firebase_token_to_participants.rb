class AddFirebaseTokenToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :firebase_token, :string
  end
end
