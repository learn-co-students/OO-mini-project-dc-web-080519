require_relative '../config/environment.rb'

# binding.pry

rob = User.new("Rob")
pete = User.new("Pete")
jc = User.new("JC")

edamame = Recipe.new
chicken_parm = Recipe.new
pot_roast = Recipe.new
milkshake = Recipe.new
spaghetti = Recipe.new

chicken = Ingredient.new("chicken")
parm = Ingredient.new("parm")


# edamame_card = RecipeCard.new("1/1/2019", "5 stars", rob, edamame)

rob.add_recipe_card(edamame, "2/5/2018", 3)
rob.add_recipe_card(chicken_parm, "2/1/2018", 4)
rob.add_recipe_card(pot_roast, "2/8/2018", 5)
rob.add_recipe_card(milkshake, "3/5/2018", 2)
rob.add_recipe_card(spaghetti, "2/5/2018", 0)

rob.declare_allergy(parm)
pete.declare_allergy(parm)
pete.declare_allergy(chicken)
rob.declare_allergy(chicken)
jc.declare_allergy(chicken)

pete.add_recipe_card(chicken_parm, "1/3/2019", 3)

chicken_parm.add_ingredients([chicken, parm])

print Ingredient.most_common_allergen
