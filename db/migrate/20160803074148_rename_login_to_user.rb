class RenameLoginToUser < ActiveRecord::Migration[5.0]
  def change
  	rename_table :logins, :users
  end
end
