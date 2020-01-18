class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.belongs_to :character
      t.string :name
    end
  end
end
