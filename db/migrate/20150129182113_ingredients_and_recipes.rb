class IngredientsAndRecipes < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:instructions, :text)

      t.timestamps
    end
    
  end
end
