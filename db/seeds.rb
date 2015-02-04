Category.create(title: "Desserts")
Category.create(title: "Appetizers")
Category.create(title: "Drinks")
Category.create(title: "Soups")


ingredients = ["Salt", "Potato", "Tomato", "Butter", "Black Pepper", "Cumin", "Sugar", "Flour", "Salmon"]
ingredients.each {|ingredient| Ingredient.create(name: ingredient)}
