class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :length
      t.integer :driver_id
      t.integer :passenger_id
    end
  end
end
