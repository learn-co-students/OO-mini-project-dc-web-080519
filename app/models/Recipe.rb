class Recipe
  # Recipe.all should return all of the recipe instances
  @@all = []
  def self.all
    @@all
  end

  def initialize
    @@all << self
  end

  # Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
    recipe_count = {}
    # go through recipe card array
    # see how many times each specific recipe repeats
    RecipeCard.all.each do |card|
      recipe_count[card.recipe] ? recipe_count[card.recipe] += 1 : recipe_count[card.recipe] = 1
    end
    # return the highest value
    recipe_count.max_by{|recipe, count| count}[0] # return just recipe instance from array
  end

  # Recipe#users should return the user instances who have recipe cards with this recipe
  def users
    #go through recipecard array
    #find recipe_cards where recipe = self
    #return array of user instances for those recipe_cards
    RecipeCard.all.find_all do |card|
      card.recipe == self
    end.map do |card|
      card.user
    end
  end

  # Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe\
  def add_ingredients(ingredient_array)
    #go through all Ingredients
    #create a new instance of recipe_ingredient and associate self(recipe) with ingredient
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  # Recipe#ingredients should return all of the ingredients in this recipe
  def ingredients
    #go through recipe_ingredients array
    #find all where recipe_ingredients.recipe = self
    #return those ingredient instances in an array
    RecipeIngredient.all.find_all do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  # Recipe#allergens should return all of the Ingredients in this recipe that are allergens for Users in our system.
  def allergens
    # get array of all unique Ingredients that are allergens for any Users
    allergens = Allergy.all.map do |allergy_pair|
      allergy_pair.ingredient
    end.uniq

    # see if any of the Ingredients in this recipe are included in the above array
    self.ingredients.find_all do |ingredient|
      allergens.include?(ingredient)
    end
  end
end
