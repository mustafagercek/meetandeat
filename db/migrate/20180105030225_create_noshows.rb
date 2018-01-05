class CreateNoshows < ActiveRecord::Migration[5.1]
  def change
    create_table :noshows do |t|
      t.references :participant, foreign_key: true
      t.references :task, foreign_key: true
      t.string :spotted

      t.timestamps
    end
  end
end
