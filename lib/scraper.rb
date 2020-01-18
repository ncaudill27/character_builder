class Scrape

  def klasses

  end

  def races
    
  end

  def get_classes
    doc = Nokogiri::HTML(open("http://dnd5eapi.co/api/classes/"))

    names = doc.text.scan(/name...[a-z]+/i).collect{|klass| klass.match(/[A-Z].+/).to_s}
    #=> Array of class names

    urls = doc.text.scan(/\/api\/classes\/[a-z]+/i)
    #=> Array of class urls for scraping details
    
    names.each.with_index do |name, index|
      c = Klass.new
      c.name = name
      c.url = urls[index]
      c.save
    end
  end

  def get_races
    doc = Nokogiri::HTML(open("http://dnd5eapi.co/api/races/"))
    names = doc.text.scan(/name...[a-z]+/i).collect{|klass| klass.match(/[A-Z].+/).to_s}
    urls = doc.text.scan(/\/api\/races\/[a-z]+/i)
    
    names.each do |name|
      c = Race.new
      c.name = name
    end
  end

  def class_details(object)
    doc = Nokogiri::HTML(open("http://dnd5eapi.co" + object.url))
    # Array of all skills and proficiencies, unparsed
    all = doc.text.scan(/\/api\/proficiencies\/[a-z]*-?[a-z]*-?[a-z]*/i).collect{|i| i.split("proficiencies/")[1]}

    scrape_skills(all)
    scrape_proficiencies(all)
    object.hit_die = doc.text.match(/hit_die..\d+/).to_s.match(/\d+/).to_s.to_i
  end

  def scrape_skills(doc)    
    # Seperate skills
    skills = parse_skills(doc)
    skills.each do |skill|
      Skill.create(name: skill)
    end

  end

  def parse_skills(doc)
    skills = doc.select{|j| j.match(/skill/)}
    names = skills.each{|skill| skill.gsub!(/skill-/, '')} #=> Array of downcase, hyphen-seperated names
    names.collect{|name| name.split("-").collect{|word| word.capitalize}.join(" ")} #=> Array of capitalized names.
  end
end