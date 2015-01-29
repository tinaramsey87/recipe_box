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
