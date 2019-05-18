class Oil 
  
  attr_accessor :name, :url, :effects
  @@all = []
  
  def initialize(name)
    @name = name
    @effects = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end