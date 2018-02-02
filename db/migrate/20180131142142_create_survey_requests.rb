class CreateSurveyRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_requests do |t|
      t.references :survey, foreign_key: true
      t.references :participant, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
