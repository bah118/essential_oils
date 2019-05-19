class Scraper
  
  # scrape and make oil objects, only gets called once
  
  def self.scrape_oils
    html = open("https://www.gardenoflife.com/content/essential-oils/")
    doc = Nokogiri::HTML(html)
    index = 0
    doc.css("div .single-content")[0].children.each do |el|
      if index >= 4 && index = doc.css("div .single-content")[0].children.count - 1
        
        #can make make oil method
        oil = Oil.new(el.children[1].css("h3").text)
        el.children[1].css("p").each do |p|
          oil.effects << p.text
        end
        oil.url = el.children[0].css("a").attr("href").value
        
        oil = Oil.new(el.children[3].css("h3").text)
        el.children[3].css("p").each do |p|
          oil.effects << p.text
        end
        oil.url = el.children[2].css("a").attr("href").value
        
      else
        index += 1
      end
        
    end
  end
  
  
  #gets called once per oil
  
  def self.scrape_oil_details(oil)
    html = open(oil.url)
    doc = Nokogiri::HTML(html)
    
  end

end