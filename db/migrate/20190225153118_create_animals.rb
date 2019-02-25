class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :species
      t.string :name
      t.integer :age
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
