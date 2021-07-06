class ChangeUsersToDrivers < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :drivers 
  end
end
