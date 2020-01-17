require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("http://dnd5eapi.co/api/classes/barbarian"))

# Source URL: http://dnd5eapi.co/api/classes/
# class names
# doc.text.scan(/name...[a-z]+/i)
# string names
# names = doc.text.scan(/name...[a-z]+/i).collect{|klass| klass.match(/[A-Z].+/).to_s}
# class urls
# urls = doc.text.scan(/\/api\/classes\/[a-z]+/i)

# class Klass
#   @@all = []
#   attr_accessor :url, :name
#   def initialize
#     @@all << self
#   end
#   def self.all
#     @@all
#   end
# end

# names.each.with_index do |name, index|
#   c = Klass.new
#   c.name = name
#   c.url = urls[index]

# end

binding.pry

# Source Klass.url slugs:

# Hit Die
# doc.text.match(/hit_die..\d+/).to_s.match(/\d+/).to_s.to_i


# doc.text.scan(/\/api\/proficiencies\/[a-z]*-?[a-z]*/i)

# Skills and Proficienies
# all = doc.text.scan(/\/api\/proficiencies\/[a-z]*-?[a-z]*-?[a-z]*/i).collect{|i| i.split("proficiencies/")[1]}

# Skills
# all.select{|i| i.match(/skill/)}

# Proficiencies
# all.select{|i| !i.match(/skill/)}