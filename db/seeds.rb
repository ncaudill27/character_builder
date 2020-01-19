s = Scraper.new
s.klasses
# ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
s.races
# ["Dragonborn", "Dwarf", "Elf", "Gnome", "Half-Elf", "Half-Orc", "Halfling", "Human", "Tiefling"]

Klass.all.each do |klass|
  s.add_details(klass) # Skills and Proficiencies
end

g = Generator.new
g.generate_users
g.generate_characters

