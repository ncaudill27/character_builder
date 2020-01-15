class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.belongs_to :user
      t.string :name
      t.string :race
      t.string :klass
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
