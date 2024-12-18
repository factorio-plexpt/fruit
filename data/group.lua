--group
data:extend {
    {
        type = "item-group",
        name = "fruit",
        icon = "__fruit__/graphics/group.png",
        icon_size = 512,
    },

    {
        type = "fuel-category",
        name = "fruit"
    }
}

local subgroups = {
    "fruit_order",
    "fruit_machine",
    "fruit_tree",
    "fruit",
    "food-core-card",
    "vegetable",
    "animal_products",
    "fruit_plant",
    "fruit_juice",
    "fruit_jam",
    "fruit_icecream",
    "fruit_pie",
    "fruit_product"
}

for index, subgroup_name in ipairs(subgroups) do
    data:extend {
        {
            type = "item-subgroup",
            name = subgroup_name,
            group = "fruit",
            order = "f" .. string.format("%03d", index)
        },
    }
end

-- RecipeCategory

local RecipeCategory = {
    "fermentation",
    "fruit_plant",
    "plant",
    "fruit_order",
    "fruit_order_restaurant",
    "food-core-card",
    "farming",
    "juice",
    "jam",
    "bbq",
    "pie",
    "pot",
    "icecream",
    "oven",
    "agitator",
    "grinder",
    "press",
    "husker",
    "washer",
}

for index, name in ipairs(RecipeCategory) do
    data:extend {
        {
            type = "recipe-category",
            name = name,
            order = "f" .. string.format("%03d", index)
        },
    }
end

-- ModuleCategory
