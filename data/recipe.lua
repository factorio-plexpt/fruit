data:extend({
    {
        type = "recipe",
        name = "sugar",
        enabled = true,
        energy_required = 5,
        ingredients = { { type = "item", name = "sugarcane", amount = 2 } },
        results = { { type = "item", name = "sugar", amount = 1 } },
    }
})

data:extend({
    {
        type = "recipe",
        name = "pie-crust",
        enabled = true,
        energy_required = 2,
        category = "oil-processing",
        ingredients = {
            { type = "item", name = "flour", amount = 10 },
            { type = "fluid", name = "water", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "pie-crust" } },

    }
})

data:extend {
    {
        type = "recipe",
        name = "flour",
        enabled = true,
        energy_required = 2,
        ingredients = {
            { type = "item", name = "wheat", amount = 2 }, --这里暂时用木头代替，之后可以修改为其他材料
        },
        results = { { type = "item", amount = 1, name = "flour" } },
    }
}

------
data:extend {
    {
        type = "recipe",
        name = "pizza",
        enabled = true,
        energy_required = 25,
        ingredients = {
            { type = "item", name = "flour", amount = 25 },
            --{ type = "item", name = "yeast", amount = 3 },
            { type = "item", name = "tomato", amount = 15 }, --jam
            { type = "item", name = "cheese", amount = 10 },
            { type = "item", name = "beef", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "pizza" } },
    },
    {
        type = "recipe",
        name = "cake",
        enabled = true,
        energy_required = 30,
        ingredients = {
            { type = "item", name = "flour", amount = 20 },
            { type = "item", name = "sugar", amount = 15 },
            { type = "item", name = "egg", amount = 5 },
            { type = "item", name = "cream", amount = 20 },
            { type = "item", name = "butter", amount = 10 },
            { type = "item", name = "milk", amount = 10 },
        },
        results = { { type = "item", amount = 1, name = "cake" } },
    },
    {
        type = "recipe",
        name = "icecream",
        enabled = true,
        energy_required = 15,
        ingredients = {
            { type = "item", name = "cream", amount = 20 },
            { type = "item", name = "milk", amount = 10 },
            { type = "item", name = "sugar", amount = 5 },
        },
        results = { { type = "item", amount = 1, name = "icecream" } },
    },
    {
        type = "recipe",
        name = "sushi",
        enabled = true,
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
    },
    {
        type = "recipe",
        name = "sandwich",
        enabled = true,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "bread", amount = 2 },
            { type = "item", name = "egg", amount = 2 },
            { type = "item", name = "lettuce", amount = 2 },
        },
        results = { { type = "item", amount = 1, name = "sandwich" } },
    },
    --{
    --    type = "recipe",
    --    name = "soup",
    --    enabled = true,
    --    energy_required = 30,
    --    ingredients = {
    --        --{ type = "item", name = "water", amount = 1000 },
    --        --{ type = "item", name = "desired vegetables/meat", amount = some },
    --        { type = "item", name = "seasoning", amount = 1 },
    --    },
    --    results = { { type = "item", amount = 1, name = "soup" } },
    --},
    {
        type = "recipe",
        name = "bread",
        enabled = true,
        energy_required = 45,
        ingredients = {
            { type = "item", name = "flour", amount = 5 },
            { type = "fluid", name = "water", amount = 200 },
            { type = "item", name = "yeast", amount = 5 },
            { type = "item", name = "salt", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "bread" } },
        category = "oil-processing",
    },
    {
        type = "recipe",
        name = "cream",
        enabled = true,
        energy_required = 10,
        ingredients = {
            { type = "item", name = "milk", amount = 5 },
        },
        results = { { type = "item", amount = 1, name = "cream" } },
    },
    {
        type = "recipe",
        name = "corn_bread",
        enabled = true,
        energy_required = 35,
        ingredients = {
            { type = "item", name = "corn", amount = 15 },
            { type = "item", name = "flour", amount = 2 },
            { type = "item", name = "milk", amount = 8 },
            { type = "item", name = "egg", amount = 1 },
            { type = "item", name = "sugar", amount = 2 },
            { type = "item", name = "yeast", amount = 10 },
        },
        results = { { type = "item", amount = 1, name = "corn_bread" } },
    },
    {
        type = "recipe",
        name = "brown_sugar",
        enabled = true,
        energy_required = 10,
        ingredients = {
            { type = "item", name = "sugarcane", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "brown_sugar" } },
    },
    {
        type = "recipe",
        name = "popcorn",
        enabled = true,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "corn", amount = 5 },
            --{ type = "item", name = "oil", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "popcorn" } },
    },
    {
        type = "recipe",
        name = "butter",
        enabled = true,
        energy_required = 15,
        ingredients = {
            { type = "item", name = "cream", amount = 5 },
        },
        results = { { type = "item", amount = 1, name = "butter" } },
    },
    {
        type = "recipe",
        name = "cheese",
        enabled = true,
        energy_required = 15,
        ingredients = {
            { type = "item", name = "milk", amount = 20 },
        },
        results = { { type = "item", amount = 1, name = "cheese" } },
    },
    {
        type = "recipe",
        name = "bacon",
        enabled = true,
        energy_required = 15,
        ingredients = {
            { type = "item", name = "pork", amount = 2 },
            --{ type = "item", name = "salt", amount = 1 },
            --{ type = "item", name = "other spices", amount = to taste },
        },
        results = { { type = "item", amount = 1, name = "bacon" } },
    },
    {
        type = "recipe",
        name = "cookie",
        enabled = true,
        energy_required = 15,
        ingredients = {
            { type = "item", name = "flour", amount = 20 },
            { type = "item", name = "butter", amount = 10 },
            { type = "item", name = "sugar", amount = 10 },
            { type = "item", name = "egg", amount = 1 },
            --{ type = "item", name = "chocolate chips/other add-ins", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "cookie" } },
    },
    {
        type = "recipe",
        name = "syrup",
        enabled = true,
        energy_required = 20,
        ingredients = {
            { type = "item", name = "sugarcane", amount = 5 },
        },
        results = { { type = "item", amount = 1, name = "syrup" } },
    },
    {
        type = "recipe",
        name = "hamburger",
        enabled = true,
        energy_required = 20,
        ingredients = {
            --{ type = "item", name = "ground beef", amount = 150 },
            { type = "item", name = "beef", amount = 2 },
            { type = "item", name = "bread", amount = 3 },
            { type = "item", name = "lettuce", amount = 2 },
        },
        results = { { type = "item", amount = 1, name = "hamburger" } },
    },
}

data:extend {
    {
        type = "recipe",
        name = "yeast",
        enabled = true,
        energy_required = 240,
        ingredients = {
            { type = "item", name = "sugar", amount = 5 },
            { type = "fluid", name = "water", amount = 25 },
        },
        results = { { type = "item", amount = 1, name = "yeast" } },
        category = "oil-processing",
    },
    {
        type = "recipe",
        name = "vinegar",
        enabled = true,
        energy_required = 60,
        ingredients = {
            { type = "item", name = "apple-juice", amount = 1 },
        },
        results = { { type = "item", amount = 1, name = "vinegar" } },
    },
    {
        type = "recipe",
        name = "soy_sauce",
        enabled = true,
        energy_required = 1440,
        ingredients = {
            { type = "item", name = "soybeans", amount = 200 },
            { type = "item", name = "wheat", amount = 50 },
            { type = "item", name = "salt", amount = 30 },
            { type = "fluid", name = "water", amount = 500 },
        },
        results = { { type = "item", amount = 10, name = "soy_sauce" } },
        category = "oil-processing",
    },
    {
        type = "recipe",
        name = "olive_oil",
        enabled = true,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "olive", amount = 50 },
        },
        results = { { type = "item", amount = 10, name = "olive_oil" } },
    },
    {
        type = "recipe",
        name = "salt",
        enabled = true,
        energy_required = 10,
        ingredients = {
            { type = "fluid", name = "water", amount = 1000 },
        },
        results = { { type = "item", amount = 1, name = "salt" } },
        category = "oil-processing",
    },
    {
        type = "recipe",
        name = "chocolate",
        enabled = true,
        energy_required = 30,
        ingredients = {
            --{ type = "item", name = "cocoa_beans", amount = 100 },
            { type = "item", name = "sugar", amount = 50 },
            { type = "item", name = "milk", amount = 50 },
        },
        results = { { type = "item", amount = 1, name = "chocolate" } },
        category = "oil-processing",
    },
}
