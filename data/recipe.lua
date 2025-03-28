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
        { type = "fluid", name = "water", amount = 50 },
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
    results = { 
        { type = "item", amount = 10, name = "yeast", probability = 0.8 }, 
        { type = "item", amount = 2, name = "yeast", probability = 0.1 } 
    },
    main_product = "yeast",
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

--RECIPE {
--    type = "recipe",
--    name = "baked-potato",
--    enabled = false,
--    energy_required = 30,
--    ingredients = {
--        { type = "item", name = "potato", amount = 1 },
--    },
--    results = { { type = "item", amount = 1, name = "baked-potato" } },
--    category = "bbq",
--}:add_unlock("barbecuing")

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

--RECIPE {
--    type = "recipe",
--    name = "french-fries",
--    enabled = false,
--    energy_required = 15,
--    ingredients = {
--        { type = "item", name = "potato", amount = 1 },
--        { type = "item", name = "olive_oil", amount = 50 },
--    },
--    results = {
--        { type = "item", name = "olive_oil", amount = 48 },
--        { type = "item", amount = 1, name = "french-fries" }
--    },
--    main_product = "french-fries",
--    category = "pot",
--}:add_unlock("frying")

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

--RECIPE {
--    type = "recipe",
--    name = "mashed-potatoes",
--    enabled = false,
--    energy_required = 20,
--    ingredients = {
--        { type = "item", name = "potato", amount = 3 },
--        { type = "item", name = "milk", amount = 50 },
--        { type = "item", name = "butter", amount = 20 },
--    },
--    results = { { type = "item", amount = 1, name = "mashed-potatoes" } },
--    category = "pot",
--}:add_unlock("frying")

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
        { type = "item", name = "sugar", amount = 1 }, -- 糖
        { type = "item", name = "ginger", amount = 1 }, -- 姜
        { type = "fluid", name = "water", amount = 1 }  -- 水
    },
    results = { { type = "item", amount = 2, name = "gingerbread" } },
    category = "oven",
}:add_unlock("baking")

RECIPE {
    type = "recipe",
    name = "organic-fertilizer",
    enabled = false,
    energy_required = 10,
    ingredients = {
        { type = "item", name = "poop", amount = 3 },
        { type = "item", name = "ash", amount = 7 }, --
        { type = "fluid", name = "water", amount = 2 }  -- 水
    },
    results = { { type = "item", amount = 1, name = "organic-fertilizer", } },
    category = "fermentation",
}:add_unlock("fermentation")


--2

---- 蜂蜜
--RECIPE {
--    type = "recipe",
--    name = "honey",
--    enabled = false,
--    energy_required = 30,
--    ingredients = {
--        { type = "item", name = "flower", amount = 5 }, -- 假设mod中存在“花”这种资源，或者可以考虑用某种浆果代替
--    },
--    results = { { type = "item", amount = 1, name = "honey" } },
--    category = "agitator", -- 搅拌机可能适合蜂蜜的制作
--}:add_unlock("advanced-agriculture") -- 可以将蜂蜜解锁放在更高级的农业科技中

-- 椰奶
RECIPE {
    type = "recipe",
    name = "coconut-milk",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "coconut", amount = 1 }, -- 假设mod中存在“椰子”这种水果
        { type = "fluid", name = "water", amount = 1 }, -- 需要水
    },
    results = { { type = "item", amount = 1, name = "coconut-milk" } },
    category = "agitator",
}:add_unlock("food-processing")

-- 香草奶昔
RECIPE {
    type = "recipe",
    name = "vanilla-milkshake",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "milk", amount = 2 }, -- 假设mod中有牛奶
        { type = "item", name = "sugar", amount = 1 },
        --{ type = "item", name = "ice", amount = 1 }, -- 假设mod中有香草
    },
    results = { { type = "item", amount = 1, name = "vanilla-milkshake" } },
    category = "agitator",
    --}:add_unlock("beverages")
}:add_unlock("food-processing")

-- 杏仁奶
--RECIPE {
--    type = "recipe",
--    name = "almond-milk",
--    enabled = false,
--    energy_required = 25,
--    ingredients = {
--        { type = "item", name = "almond", amount = 3 }, -- 假设mod中有杏仁
--        { type = "fluid", name = "water", amount = 1 },
--    },
--    results = { { type = "item", amount = 1, name = "almond-milk" } },
--    category = "agitator",
--}:add_unlock("nut-processing")

-- 白兰地
RECIPE {
    type = "recipe",
    name = "brandy",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "wine", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "brandy" } },
    category = "oak", -- 蒸馏过程可能也放在发酵室
}:add_unlock("wine")

-- 伏特加
RECIPE {
    type = "recipe",
    name = "vodka",
    enabled = false,
    energy_required = 50,
    ingredients = {
        { type = "item", name = "potato", amount = 5 }, -- 假设mod中有土豆
    },
    results = { { type = "item", amount = 1, name = "vodka" } },
    category = "oak",
}:add_unlock("wine")

-- 威士忌
RECIPE {
    type = "recipe",
    name = "whiskey",
    enabled = false,
    energy_required = 70,
    ingredients = {
        { type = "item", name = "dried-wheat", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "whiskey" } },
    category = "oak",
}:add_unlock("wine")

-- 啤酒
RECIPE {
    type = "recipe",
    name = "beer",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "dried-wheat", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
        { type = "fluid", name = "water", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "beer" } },
    category = "oak",
}:add_unlock("wine")

-- 黑朗姆酒
RECIPE {
    type = "recipe",
    name = "dark-rum",
    enabled = false,
    energy_required = 65,
    ingredients = {
        { type = "item", name = "syrup", amount = 4 },
    },
    results = { { type = "item", amount = 1, name = "dark-rum" } },
    category = "oak",
}:add_unlock("wine")

-- 白朗姆酒
RECIPE {
    type = "recipe",
    name = "white-rum",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "syrup", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "white-rum" } },
    category = "oak",
}:add_unlock("wine")

-- 清酒
RECIPE {
    type = "recipe",
    name = "sake",
    enabled = false,
    energy_required = 55,
    ingredients = {
        { type = "item", name = "dried-rice", amount = 4 },
        { type = "fluid", name = "water", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "sake" } },
    category = "oak",
}:add_unlock("wine")

-- 龙舌兰酒
RECIPE {
    type = "recipe",
    name = "tequila",
    enabled = false,
    energy_required = 75,
    ingredients = {
        { type = "item", name = "agave", amount = 5 }, -- 假设mod中有龙舌兰
        { type = "fluid", name = "water", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "tequila" } },
    category = "oak",
}:add_unlock("wine")

-- 葡萄酒
RECIPE {
    type = "recipe",
    name = "wine",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "grape", amount = 5 }, -- 假设mod中有葡萄
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "wine" } },
    category = "oak",
}:add_unlock("wine")

-- 白葡萄酒
RECIPE {
    type = "recipe",
    name = "white-wine",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "grape", amount = 5 }, -- 假设mod中有白葡萄
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "white-wine" } },
    category = "oak",
}:add_unlock("wine")

-- 茅台酒
RECIPE {
    type = "recipe",
    name = "maotai",
    enabled = false,
    energy_required = 80,
    ingredients = {
        { type = "item", name = "dried-wheat", amount = 6 }, -- 假设mod中有高粱
        { type = "fluid", name = "water", amount = 3 },
        { type = "item", name = "yeast", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "maotai" } },
    category = "oak",
}:add_unlock("brewing")

-- 香槟
RECIPE {
    type = "recipe",
    name = "champagne",
    enabled = false,
    energy_required = 90,
    ingredients = {
        { type = "item", name = "white-wine", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "champagne" } },
    category = "oak", -- 二次发酵
}:add_unlock("wine")

-- 泡芙
RECIPE {
    type = "recipe",
    name = "cream-puff",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "flour", amount = 2 },
        { type = "item", name = "egg", amount = 1 }, -- 假设mod中有通用的“蛋”
        { type = "item", name = "butter", amount = 1 },
        { type = "item", name = "cream", amount = 1 },
    },
    results = { { type = "item", amount = 2, name = "cream-puff" } },
    category = "oven",
}:add_unlock("baking")

-- 布朗尼
RECIPE {
    type = "recipe",
    name = "brownie",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "flour", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "butter", amount = 1 },
        { type = "item", name = "cocoa-powder", amount = 2 }, -- 假设mod中有可可粉
    },
    results = { { type = "item", amount = 2, name = "brownie" } },
    category = "oven",
}:add_unlock("chocolate-processing")

-- 焦糖布丁
RECIPE {
    type = "recipe",
    name = "caramel-pudding",
    enabled = false,
    energy_required = 35,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "sugar", amount = 2 },
        { type = "item", name = "egg", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "caramel-pudding" } },
    category = "pot",
}:add_unlock("baking")

-- 甜甜圈
RECIPE {
    type = "recipe",
    name = "donut",
    enabled = false,
    energy_required = 35,
    ingredients = {
        { type = "item", name = "flour", amount = 3 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "egg", amount = 1 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 2, name = "donut" } },
    category = "oven",
}:add_unlock("baking")

-- 提拉米苏
RECIPE {
    type = "recipe",
    name = "tiramisu",
    enabled = false,
    energy_required = 50,
    ingredients = {
        { type = "item", name = "cookie", amount = 3 },
        { type = "item", name = "cream", amount = 2 },
        { type = "item", name = "coffee", amount = 1 }, -- 假设mod中有咖啡
        { type = "item", name = "cocoa-powder", amount = 1 },
        { type = "item", name = "brandy", amount = 1 }, -- 可选
    },
    results = { { type = "item", amount = 1, name = "tiramisu" } },
    category = "agitator", -- 需要混合
}:add_unlock("baking")

-- 宫保鸡丁
RECIPE {
    type = "recipe",
    name = "kung-pao-chicken",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "chicken_meat", amount = 2 }, -- 假设mod中有鸡肉
        --{ type = "item", name = "peanut", amount = 3 }, -- 假设mod中有花生
        { type = "item", name = "chili", amount = 2 },
        { type = "item", name = "soy_sauce", amount = 1 },
        { type = "item", name = "vinegar", amount = 1 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "ginger", amount = 1 }, -- 假设mod中有姜
    },
    results = { { type = "item", amount = 1, name = "kung-pao-chicken" } },
    category = "pot",
}:add_unlock("cooking")

-- 汤圆
RECIPE {
    type = "recipe",
    name = "tangyuan",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "rice-flour", amount = 3 }, -- 假设mod中有糯米粉
        { type = "fluid", name = "water", amount = 1 },
        { type = "item", name = "brown_sugar", amount = 1 }, -- 假设mod中有芝麻馅
        --{ type = "item", name = "sesame_paste", amount = 1 }, -- 假设mod中有芝麻馅
    },
    results = { { type = "item", amount = 5, name = "tangyuan" } },
    category = "pot",
}:add_unlock("cooking")

-- 饺子
RECIPE {
    type = "recipe",
    name = "dumpling",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "dough", amount = 2 },
        { type = "item", name = "pork", amount = 1 }, -- 假设mod中有猪肉
        { type = "item", name = "cabbage", amount = 1 }, -- 假设mod中有白菜
        { type = "item", name = "ginger", amount = 1 }, -- 假设mod中有姜
    },
    results = { { type = "item", amount = 4, name = "dumpling" } },
    category = "pot",
}:add_unlock("cooking")

-- 炸鸡
RECIPE {
    type = "recipe",
    name = "fried-chicken",
    enabled = false,
    energy_required = 55,
    ingredients = {
        { type = "item", name = "chicken_meat", amount = 2 },
        { type = "item", name = "flour", amount = 2 },
        { type = "item", name = "egg", amount = 1 },
        { type = "item", name = "olive_oil", amount = 1 },
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 2, name = "fried-chicken" } },
    category = "bbq", -- 烧烤架可以用来炸
}:add_unlock("cooking")

-- 红烧肉
RECIPE {
    type = "recipe",
    name = "braised-pork",
    enabled = false,
    energy_required = 70,
    ingredients = {
        { type = "item", name = "pork", amount = 3 },
        { type = "item", name = "soy_sauce", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "ginger", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "braised-pork" } },
    category = "pot",
}:add_unlock("advanced-cooking")

-- 黄瓜沙拉
RECIPE {
    type = "recipe",
    name = "cucumber-salad",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "cucumber", amount = 3 }, -- 假设mod中有黄瓜
        { type = "item", name = "vinegar", amount = 1 },
        { type = "item", name = "salt", amount = 1 },
        { type = "item", name = "olive_oil", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "cucumber-salad" } },
    category = "agitator", -- 可以理解为混合
}:add_unlock("basic-food-processing")

-- 麻婆豆腐
RECIPE {
    type = "recipe",
    name = "mapo-tofu",
    enabled = false,
    energy_required = 50,
    ingredients = {
        { type = "item", name = "tofu", amount = 2 }, -- 假设mod中有豆腐
        { type = "item", name = "chicken_meat", amount = 1 }, -- 假设mod中有肉末
        { type = "item", name = "soy_sauce", amount = 1 },
        { type = "item", name = "chili", amount = 1 },
        { type = "item", name = "ginger", amount = 1 }, -- 假设mod中有姜
        --{ type = "item", name = "fermented_black_beans", amount = 1 }, -- 假设mod中有豆豉
    },
    results = { { type = "item", amount = 1, name = "mapo-tofu" } },
    category = "pot",
}:add_unlock("cooking")

-- 胡萝卜汁
RECIPE {
    type = "recipe",
    name = "carrot-juice",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "carrot", amount = 4 }, -- 假设mod中有胡萝卜
    },
    results = { { type = "item", amount = 1, name = "carrot-juice" } },
    category = "juice",
}:add_unlock("fruit-juicing")

-- 可乐
RECIPE {
    type = "recipe",
    name = "cola",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "syrup", amount = 2 },
        { type = "fluid", name = "water", amount = 2 }, -- 假设mod中有碳酸水
        --{ type = "item", name = "cola-flavoring", amount = 1 }, -- 假设mod中有可乐香料
    },
    results = { { type = "item", amount = 1, name = "cola" } },
    category = "agitator",
}:add_unlock("beverages")

-- 布丁
RECIPE {
    type = "recipe",
    name = "pudding",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "egg", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "pudding" } },
    category = "pot",
}:add_unlock("desserts")

-- 巧克力奶昔
RECIPE {
    type = "recipe",
    name = "chocolate-milkshake",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "cocoa-powder", amount = 1 }, -- 假设mod中有可可粉
    },
    results = { { type = "item", amount = 1, name = "chocolate-milkshake" } },
    category = "agitator",
}:add_unlock("beverages")

-- 汤
RECIPE {
    type = "recipe",
    name = "soup",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "fluid", name = "water", amount = 3 },
        { type = "item", name = "ginger", amount = 1 }, -- 假设mod中有姜
        --{ type = "item", name = "vegetable", amount = 2 }, -- 假设mod中有通用蔬菜
        --{ type = "item", name = "meat", amount = 1 }, -- 假设mod中有通用肉类
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "soup" } },
    category = "pot",
}:add_unlock("cooking")

-- 辣椒
-- 辣椒可以直接作为作物收获，不需要额外配方

-- 羊毛
-- 羊毛可以直接从羊身上获得，不需要额外配方

-- 干羊毛

-- 咖啡籽
-- 咖啡籽可以直接作为作物收获，不需要额外配方


