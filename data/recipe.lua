RECIPE {
    type = "recipe",
    name = "sugar",
    enabled = false,
    energy_required = 5,
    ingredients = { { type = "item", name = "sugarcane", amount = 2 } },
    results = { { type = "item", name = "sugar", amount = 1 } },
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "pie-crust",
    enabled = false,
    energy_required = 2,
    ingredients = {
        { type = "item", name = "dough", amount = 2 },
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "pie-crust" } },
    category = "press",

}:add_unlock("food-processing")

--{
--    type = "recipe",
--    name = "flour",
--    enabled = false,
--    energy_required = 2,
--    ingredients = {
--        { type = "item", name = "wheat", amount = 2 },
--    },
--    results = { { type = "item", amount = 1, name = "flour" } },
--    category = "grinder",
--}:add_unlock( "food-processing")

RECIPE {
    type = "recipe",
    name = "dough",
    enabled = false,
    energy_required = 12,
    ingredients = {
        { type = "item", name = "flour", amount = 5 },
        { type = "item", name = "yeast", amount = 1 },
        { type = "fluid", name = "water", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "dough" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "pizza",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { type = "item", name = "dough", amount = 6 },
        { type = "item", name = "yeast", amount = 3 },
        { type = "item", name = "tomato", amount = 15 }, --jam
        { type = "item", name = "cheese", amount = 10 },
        { type = "item", name = "beef", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "pizza" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "cake",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "dough", amount = 20 },
        { type = "item", name = "sugar", amount = 15 },
        { type = "item", name = "egg", amount = 5 },
        { type = "item", name = "cream", amount = 20 },
        { type = "item", name = "butter", amount = 10 },
        { type = "item", name = "milk", amount = 10 },
    },
    results = { { type = "item", amount = 1, name = "cake" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "icecream",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "cream", amount = 20 },
        { type = "item", name = "milk", amount = 10 },
        { type = "item", name = "sugar", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "icecream" } },
    category = "icecream",
    order = "aaai",
}:add_unlock("ice-cream-making")

RECIPE {
    type = "recipe",
    name = "sushi",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "rice", amount = 15 },
        { type = "item", name = "vinegar", amount = 3 },
        { type = "item", name = "soy_sauce", amount = 3 },
        { type = "item", name = "salt", amount = 1 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "egg", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "sushi" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "sandwich",
    enabled = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "bread", amount = 2 },
        { type = "item", name = "egg", amount = 2 },
        { type = "item", name = "lettuce", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "sandwich" } },
}:add_unlock("food-processing")

--{
--    type = "recipe",
--    name = "soup",
--    enabled = false,
--    energy_required = 30,
--    ingredients = {
--        --{ type = "item", name = "water", amount = 1000 },
--        --{ type = "item", name = "desired vegetables/meat", amount = some },
--        { type = "item", name = "seasoning", amount = 1 },
--    },
--    results = { { type = "item", amount = 1, name = "soup" } },
--}:add_unlock( "food-processing")

RECIPE {
    type = "recipe",
    name = "bread",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "dough", amount = 2 },
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "bread" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "cream",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "milk", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "cream" } },
    category = "agitator",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "corn_bread",
    enabled = false,
    energy_required = 35,
    ingredients = {
        { type = "item", name = "corn", amount = 15 },
        { type = "item", name = "dough", amount = 2 },
        { type = "item", name = "milk", amount = 8 },
        { type = "item", name = "egg", amount = 1 },
        { type = "item", name = "sugar", amount = 2 },
        { type = "item", name = "yeast", amount = 10 },
    },
    results = { { type = "item", amount = 1, name = "corn_bread" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "brown_sugar",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "sugarcane", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "brown_sugar" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "popcorn",
    enabled = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "corn", amount = 5 },
        { type = "item", name = "olive_oil", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "popcorn" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "butter",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "cream", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "butter" } },
    category = "agitator",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "cheese",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "milk", amount = 20 },
    },
    results = { { type = "item", amount = 1, name = "cheese" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "bacon",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "pork", amount = 1 },
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "bacon" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "cookie",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "flour", amount = 20 },
        { type = "item", name = "butter", amount = 10 },
        { type = "item", name = "sugar", amount = 10 },
        { type = "item", name = "egg", amount = 1 },
        --{ type = "item", name = "chocolate chips/other add-ins", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "cookie" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "syrup",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "sugar", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "syrup" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "hamburger",
    enabled = false,
    energy_required = 20,
    ingredients = {
        --{ type = "item", name = "ground beef", amount = 150 },
        { type = "item", name = "bread", amount = 3 },
        { type = "item", name = "beef", amount = 2 },
        { type = "item", name = "cheese", amount = 2 },
        { type = "item", name = "lettuce", amount = 2 },
        { type = "item", name = "tomato", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "hamburger" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "yeast",
    enabled = false,
    energy_required = 240,
    ingredients = {
        { type = "item", name = "sugar", amount = 5 },
        { type = "item", name = "dough", amount = 25 },
        { type = "fluid", name = "water", amount = 25 },
    },
    results = { { type = "item", amount = 1, name = "yeast", probability = 0.15 } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "yeast-cultivation",
    enabled = false,
    energy_required = 240,
    ingredients = {
        { type = "item", name = "yeast", amount = 1 },
        { type = "item", name = "flour", amount = 10 },
        { type = "fluid", name = "water", amount = 10 },
    },
    results = { { type = "item", amount = 10, name = "yeast", probability = 0.8 } },
    results = { { type = "item", amount = 2, name = "yeast", probability = 0.1 } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "vinegar",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "apple-juice", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "vinegar" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "vinegar-wheat",
    localised_name = { "item-name.vinegar" },
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "wheat", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "vinegar" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "vinegar-rice",
    localised_name = { "item-name.vinegar" },
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "rice", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "vinegar" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "soy_sauce",
    enabled = false,
    energy_required = 1440,
    ingredients = {
        { type = "item", name = "soybeans", amount = 200 },
        { type = "item", name = "wheat", amount = 50 },
        { type = "item", name = "salt", amount = 30 },
        { type = "fluid", name = "water", amount = 500 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 10, name = "soy_sauce" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "olive_oil",
    enabled = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "olive", amount = 50 },
    },
    results = { { type = "item", amount = 10, name = "olive_oil" } },
    category = "oil-processing",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "salt",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "fluid", name = "water", amount = 1000 },
    },
    results = { { type = "item", amount = 1, name = "salt" } },
    category = "chemistry",
}:add_unlock("food-processing")
RECIPE {
    type = "recipe",
    name = "swiss_roll",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { type = "item", name = "egg", amount = 4 },
        { type = "item", name = "sugar", amount = 8 },
        { type = "item", name = "dough", amount = 8 },
        { type = "item", name = "milk", amount = 4 },
        { type = "item", name = "cream", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "swiss_roll" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "baked-potato",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "potato", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "baked-potato" } },
    category = "bbq",
}:add_unlock("barbecuing")

RECIPE {
    type = "recipe",
    name = "chocolate-cake",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "dough", amount = 10 },
        { type = "item", name = "sugar", amount = 5 },
        { type = "item", name = "chocolate", amount = 5 },
        { type = "item", name = "butter", amount = 3 },
        { type = "item", name = "egg", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "chocolate-cake" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "french-fries",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "potato", amount = 1 },
        { type = "item", name = "olive_oil", amount = 50 },
    },
    results = {
        { type = "item", name = "olive_oil", amount = 48 },
        { type = "item", amount = 1, name = "french-fries" }
    },
    main_product = "french-fries",
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "tomato-soup",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { type = "item", name = "tomato", amount = 4 },
        { type = "item", name = "onion", amount = 1 },
        { type = "item", name = "salt", amount = 3 },
        { type = "fluid", name = "water", amount = 10 },
    },
    results = { { type = "item", amount = 1, name = "tomato-soup" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "caramel-apple",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "apple", amount = 1 },
        { type = "item", name = "syrup", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "caramel-apple" } },
    category = "agitator",
}:add_unlock("food-processing")
RECIPE {
    type = "recipe",
    name = "toffee",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "dough", amount = 2 },
        { type = "item", name = "sugar", amount = 8 },
        { type = "item", name = "butter", amount = 4 },
    },
    results = { { type = "item", amount = 1, name = "toffee" } },
    category = "agitator",
}:add_unlock("food-processing")
RECIPE {
    type = "recipe",
    name = "garlic-bread",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "bread", amount = 2 },
        { type = "item", name = "garlic", amount = 6 },
        { type = "item", name = "butter", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "garlic-bread" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "mayonnaise",
    enabled = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "egg", amount = 1 },
        { type = "item", name = "olive_oil", amount = 100 },
        { type = "item", name = "vinegar", amount = 10 },
    },
    results = { { type = "item", amount = 1, name = "mayonnaise" } },
    category = "agitator",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "noodles",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "dough", amount = 20 },
        { type = "item", name = "salt", amount = 2 },
    },
    results = { { type = "item", amount = 10, name = "noodles" } },
    category = "press",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "fresh-pasta",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "dough", amount = 200 },
        { type = "item", name = "egg", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "fresh-pasta" } },
    category = "press",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "grilled-asparagus",
    enabled = false,
    energy_required = 8,
    ingredients = {
        { type = "item", name = "asparagus", amount = 10 },
    },
    results = { { type = "item", amount = 1, name = "grilled-asparagus" } },
    category = "bbq",
}:add_unlock("barbecuing")

RECIPE {
    type = "recipe",
    name = "grilled-onion",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "onion", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "grilled-onion" } },
    category = "bbq",
}:add_unlock("barbecuing")

RECIPE {
    type = "recipe",
    name = "fried-rice",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "rice", amount = 10 },
        { type = "item", name = "egg", amount = 2 },
        { type = "item", name = "onion", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "fried-rice" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "mashed-potatoes",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "potato", amount = 3 },
        { type = "item", name = "milk", amount = 50 },
        { type = "item", name = "butter", amount = 20 },
    },
    results = { { type = "item", amount = 1, name = "mashed-potatoes" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "rice-noodles",
    enabled = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "rice", amount = 100 },
    },
    results = { { type = "item", amount = 1, name = "rice-noodles" } },
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "zha-jiang-mian",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "noodles", amount = 20 },
        { type = "item", name = "soy_sauce", amount = 5 },
        { type = "item", name = "onion", amount = 1 },
        { type = "item", name = "chili", amount = 10 },
    },
    results = { { type = "item", amount = 1, name = "zha-jiang-mian" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "marshmallow",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "sugar", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "marshmallow" } },
    category = "agitator",
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "tofu",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "soybeans", amount = 200 },
    },
    results = { { type = "item", amount = 1, name = "tofu" } },
    --    TODO
}:add_unlock("food-processing")

RECIPE {
    type = "recipe",
    name = "taco",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { type = "item", name = "corn", amount = 100 },
        { type = "item", name = "tomato", amount = 1 },
        { type = "item", name = "onion", amount = 1 },
        { type = "item", name = "bell_pepper", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "taco" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "spring-roll",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "dough", amount = 10 },
        { type = "item", name = "cabbage", amount = 50 },
        { type = "item", name = "carrot", amount = 50 },
    },
    results = { { type = "item", amount = 1, name = "spring-roll" } },
    category = "pot",
}:add_unlock("frying")

RECIPE {
    type = "recipe",
    name = "hot-dog",
    enabled = false,
    energy_required = 5,
    ingredients = {
        { type = "item", name = "bread", amount = 1 },
        { type = "item", name = "bacon", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "hot-dog" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "yogurt",
    enabled = false,
    energy_required = 120,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "yogurt" } },
    category = "fermentation",
}:add_unlock("fermentation")

RECIPE {
    type = "recipe",
    name = "waffle",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "dough", amount = 20 },
        { type = "item", name = "milk", amount = 20 },
        { type = "item", name = "egg", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "waffle" } },
    category = "oven",
}:add_unlock("baking")


RECIPE {
    type = "recipe",
    name = "gingerbread",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "dough", amount = 20 },
        { type = "item", name = "sugar", amount = 1 },  -- 糖
        { type = "item", name = "ginger", amount = 1 },  -- 姜
        { type = "fluid", name = "water", amount = 1 }  -- 水
    },
    results = { { type = "item", amount = 2, name = "gingerbread" } },
    category = "oven",
}:add_unlock("baking")
