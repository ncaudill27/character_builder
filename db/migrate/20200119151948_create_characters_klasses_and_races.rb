class CreateCharactersKlassesAndRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
    end

    create_table :klasses do |t|
      t.string :name
      t.string :url
    end

    create_table :characters do |t|
      t.belongs_to :user
      t.belongs_to :race
      t.belongs_to :klass
      t.string :name
      t.string :hp
      t.string :str
      t.string :con
      t.string :dex
      t.string :int
      t.string :wis
      t.string :cha
    end
  end
end
