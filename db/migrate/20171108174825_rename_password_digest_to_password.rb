class RenamePasswordDigestToPassword < ActiveRecord::Migration[5.1]
  def change
    rename_column :participants, :password_digest, :password
  end
end
