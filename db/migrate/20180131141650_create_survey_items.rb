class CreateSurveyItems < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_items do |t|
      t.references :survey, foreign_key: true
      t.string :item_type
      t.string :question

      t.timestamps
    end
  end
end
