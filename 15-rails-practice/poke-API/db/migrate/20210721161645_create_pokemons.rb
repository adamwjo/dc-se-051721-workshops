class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :weight
      t.string :image
      t.string :poke_type
      t.timestamps
    end
  end
end
