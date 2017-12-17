class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.integer :gender
      t.integer :role

      t.timestamps
    end
  end
end
