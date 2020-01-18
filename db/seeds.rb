require './lib/scraper'

User.create(username: "Dungeon Crawler", email: "example@example.com", password: "password")
User.create(username: "Edge Lord", email: "edge@obscure.com", password: "testytest")
User.create(username: "El Capitan", email: "cpt@example.com", password: "1234567890")

Character.create(user_id: 4, name: "Another Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 6, name: "Another Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 8, name: "Chappie", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 6, name: "The Dude", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 5, name: "Babushka", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 1, name: "Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 2, name: "Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 4, name: "Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 3, name: "Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 2, name: "Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 5, name: "Dummy", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)
Character.create(user_id: 9, name: "El Diablo", hp: 100, str: 12, con: 12, dex: 12, int: 12, wis: 12, cha: 12)

scrape = Scraper.new
scrape.klasses
scrape.races