class AddAuthTokenToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :auth_token, :string
  end
end
