class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :primaryCommonName
      t.string :scientificName
      t.string :iucn
      t.string :order
      t.string :family
      t.string :genus
      t.string :barriers
      t.string :justification

      t.timestamps
    end
  end
end
