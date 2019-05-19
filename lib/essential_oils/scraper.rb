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
  
  
  #gets called once per oil
  
  def self.scrape_oil_details(oil)
    html = open(oil.url)
    doc = Nokogiri::HTML(html)
    index = 0
    doc.css("div .detail")[0].children[0].each do |element|
      binding.pry
      # # element.css("p").each do |p|
      
      
      # end
      
      
      
    end
    
  end
    

end