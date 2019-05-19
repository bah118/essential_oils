# CLI Controller

class CLI 
  
  def call 
    puts "Welcome to Essential Oils!"
    Scraper.scrape_oils
    list_oils
    input = ""
    while input != "exit" do
      puts "Enter the number of an essential oil to see its details or 'exit' to exit."
      inputs = gets.strip
      # scrape page of selected oil if not already scraped
    
    end
  end
  
  def list_oils
    
    
  end
  
  def list_oil_details(oil)
    puts "#{oil.name}"
    puts "Botanical name: #{oil.botanical_name}"
    puts "Origin: #{oil.origin}"
    puts "Plant part: #{oil.plant_part}"
    puts "Story: #{oil.story}"
    puts "Effects: #{oil.effects}"
  end

end