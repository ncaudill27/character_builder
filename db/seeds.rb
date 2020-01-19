s = Scraper.new
s.klasses
s.races

Klass.all.each do |klass|
  s.add_details(klass)
end


end

generate_characters

# ["Dragonborn", "Dwarf", "Elf", "Gnome", "Half-Elf", "Half-Orc", "Halfling", "Human", "Tiefling"]

# ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]