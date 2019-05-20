class Scraper
  
  # scrape and make oil objects, only gets called once
  
  def self.scrape_oils
    html = open("https://www.gardenoflife.com/content/essential-oils/")
    doc = Nokogiri::HTML(html)
    oil_array = doc.css("div .single-content")[0].children[4..-4]
    oil_array.each do |element|

        #first oils column
        oil = Oil.new(element.children[1].css("h3").text)
        element.children[1].css("p").each do |p|
          oil.effects << p.text
        end
        oil.url = element.children[0].css("a").attr("href").value
        
        #second oils column
        oil = Oil.new(element.children[3].css("h3").text)
        element.children[3].css("p").each do |p|
          oil.effects << p.text
        end
        oil.url = element.children[2].css("a").attr("href").value
    end
  end
  
  
  # gets called once per oil
  
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