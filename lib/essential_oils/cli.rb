class CLI 
  
  def call 
    puts "******************************".colorize(:light_magenta)
    puts "  Welcome to Essential Oils!".colorize(:light_blue).bold
    puts "******************************".colorize(:light_magenta)
    Scraper.scrape_oils
    input = ""
    while input.downcase != "exit" do
      list_oils
      puts "", "Enter a number to see details for that essential oil or type 'exit' to exit.".colorize(:green)
      input = gets.strip
      if input.to_i >= 1 && input.to_i <= Oil.all.count
        oil = Oil.all[input.to_i - 1]
        Scraper.scrape_oil_details(oil) if !oil.origin
        list_oil_details(oil)
      end
    end
    puts "Goodbye!".colorize(:light_magenta)
  end
  
  def list_oils
    number = 1
    puts "", "Here are our essential oils:".colorize(:green), ""
    Oil.all.each do |oil|
      puts "#{number}. #{oil.name}".colorize(:light_blue)
      number += 1
    end
  end
  
  def list_oil_details(oil)
    puts "", "********************************".colorize(:light_black).bold
    puts "Essential oil: #{oil.name}".colorize(:light_magenta), ""
    puts "Botanical name: #{oil.botanical_name}".colorize(:light_red), ""
    puts "#{oil.attributes}".colorize(:yellow), ""
    puts "#{oil.origin}".colorize(:green), ""
    puts "#{oil.plant_part}".colorize(:light_blue), ""
    puts "#{oil.story}".colorize(:light_magenta), ""
    puts "#{oil.use}".colorize(:light_red), ""
    puts "#{oil.applications}".colorize(:yellow), ""
    puts "********************************".colorize(:light_black).bold
  end

end