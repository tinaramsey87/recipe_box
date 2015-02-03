require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients)}
  it { should have_and_belong_to_many(:categories)}

  describe('#rating') do
    it('assigns a rating to the recipe') do
      test_recipe = Recipe.create({ :title => "Baked Potato" :instructions => "Put potato in oven" :rating => 5 })
      expect(test_recipe.rating).to(eq(5))
    end
  end

end
