class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
      t.string :name
      t.integer :species_id
      t.date :date_of_birth
      t.datetime :last_fed

      t.timestamps
    end
  end

  def self.down
    drop_table :animals
  end
end
