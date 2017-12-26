class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :task, foreign_key: true
      t.references :participant, foreign_key: true
      t.boolean :timeslot1
      t.boolean :timeslot2
      t.boolean :timeslot3
      t.integer :query_state
      t.integer :invitation_state
      t.timestamps
    end
  end
end
