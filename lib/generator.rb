class Generator

  def usernames
    [
      "ManBearPig", "IRL User", "Mando", "Zed's Undead", "Mrs. Rainbow",
      "Mangragora Seed", "The Last Targaryen", "Bright", "Fire Queen", "John"
    ]
  end

  def random_char_name
    names = [
      "Another Dummy", "Chappie", "The Dude", "Babushka", "Dummy",
      "El Diablo", "Babayaga", "Tornado Joe", "Schmidt", "Earlinflier"
    ]
    names[rand(names.count)]
  end

  def generate_users
    10.times do |i|
      u = User.new(
        username: usernames[i],
        email: "example#{i}@example.com"
        password: "password"
      )
      u.save
    end
  end

  def generate_characters
    25.times do
      c = Character.new(
        name: random_char_name,
        hp: rand(100),
        str: rand(20),
        con: rand(20),
        dex: rand(20),
        int: rand(20),
        wis: rand(20),
        cha: rand(20)
      )
      c.user = User.all[rand(User.all.count)],
      c.race = Race.all[rand(Race.all.count)]
      c.klass = Klass.all[rand(Klass.all.count)]
      c.save
    end
end