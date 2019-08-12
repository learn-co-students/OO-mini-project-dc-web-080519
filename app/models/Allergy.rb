class Allergy

  attr_reader :ingredient, :user
  @@all = []

  def initialize(ingredient, user)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  # Allergy.all should return all of the Allergy instances
  def self.all
    @@all
  end

end
