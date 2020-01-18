class Scrape

  def klasses
    get_classes
    Klass.all.each do |klass|
      add_details(klass)
    end
  end

  def races
    doc = Nokogiri::HTML(open("http://dnd5eapi.co/api/races/"))
    names = doc.text.scan(/name...[a-z]+/i).collect{|klass| klass.match(/[A-Z].+/).to_s}
    urls = doc.text.scan(/\/api\/races\/[a-z]+/i)
    
    names.each do |name|
      Race.create(name: name)
    end
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

  def add_details(object)
    doc = Nokogiri::HTML(open("http://dnd5eapi.co" + object.url))
    # Array of all skills and proficiencies, unparsed
    all = doc.text.scan(/\/api\/proficiencies\/[a-z]*-?[a-z]*-?[a-z]*/i).collect{|i| i.split("proficiencies/")[1]}

    skills = parse_skills(all)
    proficiencies = parse_proficiencies(all)

    skills.each do |skill|
      skill = Skill.create(name: skill)
      object.skills << skill
    end

    proficiencies.each do |proficiency|
      prof = Proficiency.create(name: proficiency)
    end

    

    object.hit_die = doc.text.match(/hit_die..\d+/).to_s.match(/\d+/).to_s.to_i
  end

  def parse_skills(doc)
    skills = doc.select{|j| j.match(/skill/)} # Still need to remove "skill-" from each word
    names = skills.each{|skill| skill.gsub!(/skill-/, '')} #=> Array of downcase, hyphen-seperated names
    names.collect{|name| name.split("-").collect{|word| word.capitalize}.join(" ")} #=> Array of capitalized names.
  end

  def parse_proficiencies(doc)
    names = doc.select{|j| !j.match(/skill/)}
    names.collect{|name| name.split("-").collect{|word| word.capitalize}.join(" ")}
  end
end