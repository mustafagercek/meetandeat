class RenamePasswordToPasswordDigest < ActiveRecord::Migration[5.1]
  def change
    rename_column :participants, :password, :password_digest
  end
end
