class Ingredient

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  # Ingredient.all should return all of the ingredient instances
  def self.all
    @@all
  end

  # Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    allergen_count = {}

    Allergy.all.each do |allergy|
      allergen_count[allergy.ingredient] ? allergen_count[allergy.ingredient] += 1 : allergen_count[allergy.ingredient] = 1
    end

    allergen_count.max_by { |allergen, count| count }[0]
  end
end
