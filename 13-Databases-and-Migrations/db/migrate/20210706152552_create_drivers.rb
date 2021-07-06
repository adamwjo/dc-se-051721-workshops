class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
    end
  end
end

# create_table is an activerecord method that takes two arguments
# the first is the table builder, the second is the block
# activerecord will pass to your block the table builder