class AddHitDieColumnToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :hit_die, :integer
  end
end
