class CLI 
  
  def call 
    puts "******************************"
    puts "  Welcome to Essential Oils!"
    puts "******************************"
    Scraper.scrape_oils
    input = ""
    while input.downcase != "exit" do
      list_oils
      puts "", "Enter a number to see details for that essential oil or type 'exit' to exit."
      input = gets.strip
      if input.to_i >= 1 && input.to_i <= Oil.all.count
        oil = Oil.all[input.to_i - 1]
        Scraper.scrape_oil_details(oil) if !oil.origin
        list_oil_details(oil)
      end
    end
  end
  
  def list_oils
    number = 1
    puts "", "Here are our essential oils:", ""
    Oil.all.each do |oil|
      puts "#{number}. #{oil.name}"
      number += 1
    end
  end
  
  def list_oil_details(oil)
    puts "", "Essential oil: #{oil.name}", ""
    puts "Botanical name: #{oil.botanical_name}", ""
    puts "#{oil.attributes}", ""
    puts "#{oil.origin}", ""
    puts "#{oil.plant_part}", ""
    puts "#{oil.story}", ""
    puts "#{oil.use}", ""
    puts "#{oil.applications}"
  end

end