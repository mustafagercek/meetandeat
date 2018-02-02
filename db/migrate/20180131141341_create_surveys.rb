class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :description
      t.references :task, foreign_key: true
      t.integer :attendance_query_state
      t.integer :attendance_invitation_state
      t.string :state, default: 'not started'

      t.timestamps
    end
  end
end
