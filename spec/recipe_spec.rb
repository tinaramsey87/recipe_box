require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients)}
  it { should have_and_belong_to_many(:categories)}

<<<<<<< HEAD
  describe('#rating') do
    it('assigns a rating to the recipe') do
      test_recipe = Recipe.create({ :title => "Baked Potato" :instructions => "Put potato in oven" :rating => 5 })
      expect(test_recipe.rating).to(eq(5))
    end
  end

=======
>>>>>>> 4b5ac0c088cffdbc1def938ce6b6a8935ffa8a24
end
