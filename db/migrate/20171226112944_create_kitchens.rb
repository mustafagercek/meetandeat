class CreateKitchens < ActiveRecord::Migration[5.1]
  def change
    create_table :kitchens do |t|
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
