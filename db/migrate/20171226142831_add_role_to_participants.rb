class AddRoleToParticipants < ActiveRecord::Migration[5.1]
  def change
    add_reference :participants, :role, foreign_key: true
  end
end
