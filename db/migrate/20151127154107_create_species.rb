class CreateSpecies < ActiveRecord::Migration
  def self.up
    create_table :species do |t|
      t.string :name
      t.string :latin_name
      t.integer :no_of_legs

      t.timestamps
    end
  end

  def self.down
    drop_table :species
  end
end
