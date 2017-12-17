class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :address
      t.string :description
      t.string :incentive
      t.boolean :timeslot1
      t.boolean :timeslot2
      t.boolean :timeslot3
      t.integer :participantslot1
      t.integer :participantslot2
      t.integer :participantslot3
      t.datetime :survey_start
      t.datetime :survey_end
      t.integer :survey_state

      t.timestamps
    end
  end
end
