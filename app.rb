require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ('/') do
  @recipes = Recipe.all

  erb(:index)
end

get('/recipes/add_recipe') do

  erb(:add_recipe)
end

post('/recipes/add_recipe') do
  recipe_title = params["recipe_title"]
  recipe_instructions = params["recipe_instructions"]
  @recipe = Recipe.create({ :title => recipe_title, :instructions => recipe_instructions })

  redirect('/')
end

get('/ingredients/add_ingredient') do
  @ingredients = Ingredient.all

  erb(:add_ingredient)
end

post('/ingredients/add_ingredient') do
  ingredient = params["ingredient"]
  @ingredient = Ingredient.create({ :name => ingredient })

  redirect('ingredients/add_ingredient')
end

<<<<<<< HEAD
get('/categories/add_category') do

  erb(:add_categories)
end

post('/categories/add_category') do
  category_title = params["category_title"]
  @category = Category.create({ :title => category_title })
  
  redirect('/')
end

=======
>>>>>>> 4b5ac0c088cffdbc1def938ce6b6a8935ffa8a24
get('/recipes/:id') do
  @recipe = Recipe.find(params["id"])
  @category = Category.find(params["id"])
  @ingredients = Ingredient.all()
  @categories = Category.all()

  erb(:ingredient_recipe)
end

post('/ingredients/:id') do
  ingredient_id = params["ingredient_id"]
  @ingredient = Ingredient.find(ingredient_id.to_i)
  @recipe = Recipe.find(params["id"])
  @recipe.ingredients << @ingredient

  redirect back
end

post('/categories/:id') do
  category_id = params["category_id"]
  @category = Category.find(category_id.to_i)
  @recipe = Recipe.find(params["id"])
<<<<<<< HEAD
  @recipe.categories << @category
=======
  @category.recipes << @recipes
>>>>>>> 4b5ac0c088cffdbc1def938ce6b6a8935ffa8a24

  redirect back
end

delete('/recipes/:id') do
  @recipe = Recipe.find(params['id'])
  @recipe.destroy()
  redirect('/')
end
<<<<<<< HEAD
=======

get('/ingredients/add_ingredient') do
  @categories = Category.all

  erb(:add_categories)
end

get('/categories/add_category') do

  erb(:add_categories)
end

post('/categories/add_category') do
  category = params["category"]
  @category = Category.create({ :title => category })

  redirect('categories/add_category')
end
>>>>>>> 4b5ac0c088cffdbc1def938ce6b6a8935ffa8a24
