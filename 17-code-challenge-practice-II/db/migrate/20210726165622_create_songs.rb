class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :youtube_link
      t.timestamps
    end
  end
end
