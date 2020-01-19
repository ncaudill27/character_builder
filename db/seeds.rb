# s = Scraper.new
# s.klasses
# s.races

# Klass.all.each do |klass|
#   s.add_details(klass)
# end

# def random_name
#   names = [
#     "Another Dummy", "Chappie", "The Dude", "Babushka", "Dummy",
#     "El Diablo", "Babayaga", "Tornado Joe", "Schmidt", "Earlinflier"
#   ]
#   names[rand(names.count)]
# end

# def random_active_user_id
#   ids = [1, 2, 4, 5, 6, 7, 8, 9, 10, 11]
#   ids[rand(ids.count)]
# end

# def generate_characters
#   25.times do
#     c = Character.new(
#       user_id: random_active_user_id,
#       name: random_name,
#       hp: rand(100),
#       str: rand(20),
#       con: rand(20),
#       dex: rand(20),
#       int: rand(20),
#       wis: rand(20),
#       cha: rand(20)
#     )
#     c.race = Race.all[rand(Race.all.count)]
#     c.klass = Klass.all[rand(Klass.all.count)]
#     c.save
#   end
# end

# generate_characters

# ["Dragonborn", "Dwarf", "Elf", "Gnome", "Half-Elf", "Half-Orc", "Halfling", "Human", "Tiefling"]

# ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]