class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :address
      t.string :description
      t.string :incentive
      t.datetime :timeslot1
      t.datetime :timeslot2
      t.datetime :timeslot3
      t.datetime :survey_start
      t.datetime :survey_end
      t.integer :survey_state
      t.integer :algorithm
      t.integer :current_level, default: 5
      t.integer :winningTimeSlot
      t.timestamps
    end
  end
end
