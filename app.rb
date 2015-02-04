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
  @recipe = Recipe.create({ :title => recipe_title, :instructions => recipe_instructions, :rating => 0 })

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

get('/categories/add_category') do

  erb(:add_categories)
end

get('/categories') do
  @categories = Category.all

  erb(:categories)
end

post('/categories/add_category') do
  category_title = params["category_title"]
  @category = Category.create({ :title => category_title })

  redirect('/')
end

get('/recipes/:id') do
  @recipe = Recipe.find(params["id"])
  @ingredients = Ingredient.all()
  @categories = Category.all()

  erb(:ingredient_recipe)
end

patch '/recipes/:id' do
  recipe = Recipe.find(params['id'])
  recipe_title = params['recipe_title']
  instructions = params['instructions']
  recipe.update(title: recipe_title, instructions: instructions)

  redirect back
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params["id"])
  @ingredients = Ingredient.all()
  @categories = Category.all()

  erb(:recipe_edit)
end

get '/recipes/:id/rate/:rating' do
  recipe = Recipe.find(params['id'])
  rating = params['rating']
  recipe.update(rating: rating)

  redirect back
end

post('/ingredients/:id') do
  ingredient_id = params["ingredient_id"]
  @ingredient = Ingredient.find(ingredient_id.to_i)
  @recipe = Recipe.find(params["id"])
  @recipe.ingredients << @ingredient

  redirect back
end

patch('/ingredients/:id') do
  ingredient = Ingredient.find(params['id'])
  recipe = Recipe.find(params['recipe_id'])
  recipe.ingredients.delete(ingredient)

  redirect back
end

get '/categories/:id' do
  @category = Category.find(params['id'])

  erb(:category)
end

post('/categories/:id') do
  category_id = params["category_id"]
  @category = Category.find(category_id.to_i)
  @recipe = Recipe.find(params["id"])
  @recipe.categories << @category

  redirect back
end

patch '/categories/:id' do
  category = Category.find(params['id'])
  recipe = Recipe.find(params['recipe_id'])
  category.recipes.delete(recipe)

  redirect back
end

delete('/recipes/:id') do
  @recipe = Recipe.find(params['id'])
  @recipe.destroy()
  redirect('/')
end

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
