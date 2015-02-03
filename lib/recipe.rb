class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)

<<<<<<< HEAD
  def :rating do
    self.
  end
=======

>>>>>>> 4b5ac0c088cffdbc1def938ce6b6a8935ffa8a24
end
