class AddKitchenToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :kitchen, foreign_key: true
  end
end
