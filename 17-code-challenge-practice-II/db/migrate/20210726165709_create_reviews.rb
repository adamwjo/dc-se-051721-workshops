class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :super_fan_id
      t.integer :song_id
      t.integer :rating
      t.string :comment 
      t.timestamps
    end
  end
end
