class CreateTaskRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :task_requirements do |t|
      t.references :task
      t.references :role
      t.integer :number
      t.integer :timeslot1_acceptance, default: 0
      t.integer :timeslot2_acceptance, default: 0
      t.integer :timeslot3_acceptance, default: 0

      t.timestamps
    end
  end
end
