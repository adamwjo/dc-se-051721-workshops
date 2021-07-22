class CreatePokeballs < ActiveRecord::Migration[6.1]
  def change
    create_table :pokeballs do |t|
      t.integer :pokemon_id
      t.integer :trainer_id
      t.string :ball_type
      t.timestamps
    end
  end
end
