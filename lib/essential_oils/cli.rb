# CLI Controller

class CLI 
  
  def call 
    puts "Welcome to Essential Oils!"
    puts ""
    Scraper.scrape_oils
    list_oils
    puts ""
    input = ""
    while input != "exit" do
      puts "Enter a number to see details for that essential oil or type 'exit' to exit."
      input = gets.strip
      # scrape page of selected oil if not already scraped
    # binding.pry
    end
  end
  
  def list_oils
    number = 1
    Oil.all.each do |oil|
      puts "#{number}. #{oil.name}"
      number += 1
    end
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