class CreateRacesAndKlasses < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
    end
  end

  def change
    create_table :klasses do |t|
      t.string :name
      t.string :url
    end
  end

  def change
    add_column :characters, :klass, :belongs_to
    add_column :characters, :race, :belongs_to
  end
end
