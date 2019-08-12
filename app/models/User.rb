class User
  attr_reader :name

  # User.all should return all of the user instances
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipe_cards
    RecipeCard.all.find_all do |card|
      card.user == self
    end
  end

  # User#recipes should return all of the recipes this user has recipe cards for
  def recipes
    self.recipe_cards.map do |card|
      card.recipe
    end
  end

  # User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, date, rating, self)
  end

  # User#declare_allergy should accept anIngredient instance as an argument, and create a new Allergy instance for this User and the given Ingredient
  def declare_allergy(ingredient)
    Allergy.new(ingredient, self)
  end


  # User#top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
    #sort descending by recipe_card.rating
    sorted_recipes = self.recipe_cards.sort_by { |card| card.rating}.reverse
    # limit results to first three
    sorted_recipes[0..2]
  end

  # User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    # sort descending by user's recipe_card date
    sorted_recipes = self.recipe_cards.sort_by { |card| card.date}.reverse
    # return most recent result
    sorted_recipes[0].recipe
  end

  # User#allergens should return all of the ingredients this user is allergic to
  def allergens
    # loop over Allergy.all array
    # find all entries where Allergy.user = self
    # return array of ingredients
    Allergy.all.find_all do |allergy|
      allergy.user == self
    end.map { |allergy| allergy.ingredient }
  end
end
