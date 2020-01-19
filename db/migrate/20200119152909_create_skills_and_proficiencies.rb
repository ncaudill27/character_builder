class CreateSkillsAndProficiencies < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.belongs_to :klass
      t.string :name
    end

    create_table :proficiencies do |t|
      t.belongs_to :klass
      t.string :name
    end
  end
end
