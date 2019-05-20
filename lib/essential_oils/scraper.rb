class Scraper

  def self.scrape_oils
    html = open("https://www.gardenoflife.com/content/essential-oils/")
    doc = Nokogiri::HTML(html)
    oil_array = doc.css("div .single-content")[0].children[4..-4]
    oil_array.each do |element|
        oil = Oil.new(element.children[1].css("h3").text)
        oil.url = element.children[0].css("a").attr("href").value
        oil = Oil.new(element.children[3].css("h3").text)
        oil.url = element.children[2].css("a").attr("href").value
    end
  end
  
  def self.scrape_oil_details(oil)
    html = open(oil.url)
    doc = Nokogiri::HTML(html)
    oil.botanical_name = doc.css("div .detail")[0].children[1].css("p")[0].text
    oil.attributes = doc.css("div .detail")[0].children[1].css("p")[1].text
    oil.origin = doc.css("div .detail")[0].children[1].css("p")[2].text
    oil.plant_part = doc.css("div .detail")[0].children[1].css("p")[3].text
    oil.story = doc.css("div .detail")[0].children[1].css("p")[4].text
    oil.use = doc.css("div .detail")[0].children[1].css("p")[5].text
    oil.applications = doc.css("div .detail")[0].children[1].css("p")[6].text
  end
    
end