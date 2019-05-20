class Oil 
  
  attr_accessor :name, :url, :botanical_name, :attributes, :origin, :plant_part, :story, :use, :applications
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end