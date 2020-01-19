s = Scraper.new
s.klasses
s.races

Klass.all.each do |klass|
  s.add_details(klass) # Skills and Proficiencies
end

g = Generator.new
g.generate_users
g.generate_characters

