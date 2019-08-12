class RecipeCard
  # RecipeCard#date should return the date of the entry
  # RecipeCard#rating should return the rating (an integer) a user has given their entry
  # RecipeCard#user should return the user to which the entry belongs
  # RecipeCard#recipe should return the recipe to which the entry belongs
  attr_reader :date, :rating, :user, :recipe

  @@all = []

  # RecipeCard.all should return all of the RecipeCard instances
  def self.all
    @@all
  end

  def initialize(recipe, date, rating, user)
    @recipe = recipe
    @date = date
    @rating = rating
    @user = user
    @@all << self
  end
end
