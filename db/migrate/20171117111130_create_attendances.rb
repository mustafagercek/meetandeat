class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :task, foreign_key: true
      t.references :participant, foreign_key: true
      t.integer :response

      t.timestamps
    end
  end
end
