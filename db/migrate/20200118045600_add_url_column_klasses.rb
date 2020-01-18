class AddUrlColumnKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :url, :string
  end
end
