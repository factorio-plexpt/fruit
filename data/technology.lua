data:extend({
    {
        type = "technology",
        name = "food-processing",
        icon = "__fruit__/graphics/icon/food-processing.png",
        icon_size = 512,
        effects = {
        },
        prerequisites = { "automation" },
        unit = {
            count = 300,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
    },
    {
        type = "technology",
        name = "sugar-processing",
        icon = "__fruit__/graphics/juice.png",
        icon_size = 512,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "sugar"
            }
        },
        prerequisites = { "oil-processing" }, --需要化学科技解锁
        unit = {
            count = 500,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            -- 10-60
            time = 30,
        },
        order = "b-f-b"
    }
})

function add_fruit_technology(pre, recipe, item, entity, ingredients)

    data:extend {
        {
            type = "technology",
            name = recipe.name or item.name or entity.name,
            icon = recipe.icon or item.icon or entity.icon,
            icon_size = recipe.icon_size or item.icon_size or entity.icon_size or 512,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = recipe.name or item.name or entity.name,
                }
            },
            prerequisites = { pre }, --需要化学科技解锁
            unit = {
                count = 500,
                ingredients = ingredients or {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack", 1 }
                },
                -- 10-60
                time = 30,
            },
        }
    }
end

-- 定义面粉科技
data:extend {
    {
        type = "technology",
        name = "wheat-processing",
        icon = "__fruit__/graphics/vegetable/wheat.png",
        icon_size = 512,
        localised_name = { "", { "item-name.wheat" } },
        localised_description = { "", { "item-description.wheat" } },
        effects = {
            { type = "unlock-recipe", recipe = "wheat-peeling" },
            { type = "unlock-recipe", recipe = "wheat-milling" },

        },
        prerequisites = { "food-processing" },
        unit = {
            count = 200,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
    },
    {
        type = "technology",
        name = "rice-processing",
        icon = "__fruit__/graphics/icon/rice.png",
        icon_size = 512,
        effects = {
            { type = "unlock-recipe", recipe = "rice-husking" },
            { type = "unlock-recipe", recipe = "rice-flour-grinding" },
        },
        prerequisites = { "food-processing" },
        unit = {
            count = 500,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
            },
            time = 30,
        },
    },
    {
        type = "technology",
        name = "vinegar-wheat",
        icon = "__fruit__/graphics/icon/vinegar.png",
        icon_size = 512,
        localised_name = { "item-name.vinegar" },
        localised_description = { "", { "item-description.vinegar" } },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "vinegar-wheat"
            },
        },
        prerequisites = { "wheat-processing" },
        unit = {
            count = 200,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
    },
    {
        type = "technology",
        name = "soy_sauce",
        icon = "__fruit__/graphics/icon/soy_sauce.png",
        icon_size = 512,
        localised_name = { "item-name.soy_sauce" },
        localised_description = { "", { "item-description.soy_sauce" } },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "soy_sauce"
            },
        },
        prerequisites = { "wheat-processing" },
        unit = {
            count = 200,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
    },
    {
        type = "technology",
        name = "chocolate-processing",
        icon = "__fruit__/graphics/icon/chocolate.png",
        icon_size = 512,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-extraction"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-fermentation"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-roasting"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-powder-grinding"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-liquor"
            },
            {
                type = "unlock-recipe",
                recipe = "refined-chocolate"
            },

            {
                type = "unlock-recipe",
                recipe = "chocolate-bar-molding"
            },
        },
        prerequisites = { "wheat-processing" },
        unit = {
            count = 500,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
    },
    {
        type = "technology",
        name = "wool-processing",
        icon = "__fruit__/graphics/icon/wool.png",
        icon_size = 128,
        effects = {
            { type = "unlock-recipe", recipe = "wool-cleaning" },
            { type = "unlock-recipe", recipe = "wool-spinning" },
        },
        prerequisites = { "food-processing" },
        unit = {
            count = 100,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
            },
            time = 30,
        },
    },

    {
        type = "technology",
        name = "coffee-processing",
        icon = "__fruit__/graphics/icon/coffee-bean.png",
        icon_size = 512,
        effects = {
            { type = "unlock-recipe", recipe = "coffee-seed-fermentation" },
            { type = "unlock-recipe", recipe = "coffee-seed-roasting" },
            { type = "unlock-recipe", recipe = "coffee-powder-grinding" },
        },
        prerequisites = { "food-processing" },
        unit = {
            count = 300,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 20
        },
    },
}
