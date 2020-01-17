require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("http://dnd5eapi.co/api/classes/"))

binding.pry

# class names
# doc.text.scan(/name...[a-z]+/i)
# string names
# doc.text.scan(/name...[a-z]+/i)[0].match(/[A-Z].+/).to_s
# class urls
# doc.text.scan(/api\/classes\/[a-z]+/i)

class Klass
  @@all = []
  attr_accessor :url, :name
  
end

