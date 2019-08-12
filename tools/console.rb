require_relative '../config/environment.rb'

# binding.pry

rob = User.new("Rob")
pete = User.new("Pete")
jc = User.new("JC")

# edamame = Recipe.new
chicken_parm = Recipe.new
pot_roast = Recipe.new
# milkshake = Recipe.new
spaghetti = Recipe.new

chicken = Ingredient.new("chicken")
parm = Ingredient.new("parm")
beef = Ingredient.new("beef")
mushrooms = Ingredient.new("mushrooms")
pasta = Ingredient.new("pasta")
tomato_sauce = Ingredient.new("tomato_sauce")

chicken_parm.add_ingredients([chicken, parm, tomato_sauce])
pot_roast.add_ingredients([beef, mushrooms])
spaghetti.add_ingredients([pasta, tomato_sauce])


# rob.add_recipe_card(edamame, "2/5/2018", 3)
rob.add_recipe_card(chicken_parm, "2/1/2018", 4)
rob.add_recipe_card(pot_roast, "2/8/2018", 5)
# rob.add_recipe_card(milkshake, "3/5/2018", 2)
rob.add_recipe_card(spaghetti, "2/5/2018", 0)
pete.add_recipe_card(chicken_parm, "1/3/2019", 3)

rob.declare_allergy(parm)
rob.declare_allergy(chicken)
pete.declare_allergy(beef)
jc.declare_allergy(chicken)
jc.declare_allergy(tomato_sauce)

print "Rob's safe recipes are pot roast and spaghetti - "
print rob.safe_recipes == [pot_roast, spaghetti]
puts ""

print "Pete's safe recipes are chicken_parm and spaghetti - "
print pete.safe_recipes == [chicken_parm, spaghetti]
puts ""

print "JC's safe recipe is pot roast - "
print jc.safe_recipes == [pot_roast]
