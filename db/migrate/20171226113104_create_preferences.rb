class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.references :participant, foreign_key: true
      t.references :kitchen, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
