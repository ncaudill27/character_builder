class RemoveRaceAndKlassFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :race
    remove_column :characters, :klass
  end
end
