class CreateSurveyAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_answers do |t|
      t.references :survey_item, foreign_key: true
      t.references :participant, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
