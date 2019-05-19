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
  
end