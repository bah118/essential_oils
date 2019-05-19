class Oil 
  
  attr_accessor :name, :url, :botanical_name, :effects, :origin, :plant_part, :story
  @@all = []
  
  def initialize(name)
    @name = name
  #  @effects = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end