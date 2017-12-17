class AddPasswordDigestToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_column :participants, :password_digest, :string
  end
end
