class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []
  @@cats = []
  @@dogs = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self

  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    @@cats << Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    @@dogs << Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
    end
    cats.each do |cat|
      cat.owner = nil
    end

    dogs.each do |dog|
      dog.mood = "nervous"
    end
    dogs.each do |dog|
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
