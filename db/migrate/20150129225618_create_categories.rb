class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:title, :string)

      t.timestamps
    end

    create_table(:categories_recipes) do |t|
      t.belongs_to(:category)
      t.belongs_to(:recipe)

      t.timestamps
    end
  end
end
