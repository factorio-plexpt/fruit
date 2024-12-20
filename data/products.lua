
local items = {
    ["coconut-milk"] = { r = 1, g = 1, b = 0.94, a = 1 }, -- Off-White
    ["vanilla-milkshake"] = { r = 0.98, g = 0.96, b = 0.93, a = 1 }, -- Light Beige
    ["almond-milk"] = { r = 0.97, g = 0.94, b = 0.90, a = 1 }, -- Pale Cream
    ["brandy"] = { r = 0.80, g = 0.60, b = 0.40, a = 1 }, -- Amber
    ["vodka"] = { r = 0.95, g = 0.95, b = 0.95, a = 0.3 }, -- Nearly Clear (slight tint)
    ["whiskey"] = { r = 0.76, g = 0.57, b = 0.38, a = 1 }, -- Light Brown
    ["beer"] = { r = 0.94, g = 0.78, b = 0.34, a = 1 }, -- Light Golden
    ["dark-rum"] = { r = 0.59, g = 0.37, b = 0.20, a = 1 }, -- Dark Brown
    ["white-rum"] = { r = 0.94, g = 0.94, b = 0.86, a = 0.6 }, -- Very Pale Yellow
    ["sake"] = { r = 0.96, g = 0.96, b = 0.90, a = 0.8 }, -- Cloudy White
    ["tequila"] = { r = 0.93, g = 0.80, b = 0.49, a = 0.7 }, -- Light Gold
    ["wine"] = { r = 0.60, g = 0.10, b = 0.10, a = 1 }, -- Deep Red (assuming red wine)
    ["white-wine"] = { r = 0.98, g = 0.97, b = 0.80, a = 1 }, -- Pale Yellow
    ["maotai"] = { r = 0.98, g = 0.97, b = 0.90, a = 0.7 }, -- Slightly Cloudy White
    ["champagne"] = { r = 0.98, g = 0.95, b = 0.75, a = 0.7 }, -- Light Gold
    ["cream-puff"] = { r = 0.99, g = 0.98, b = 0.90, a = 1 }, -- Pale Cream
    ["brownie"] = { r = 0.40, g = 0.20, b = 0.00, a = 1 }, -- Dark Brown
    ["caramel-pudding"] = { r = 0.87, g = 0.72, b = 0.53, a = 1 }, -- Caramel
    ["donut"] = { r = 0.85, g = 0.65, b = 0.40, a = 1 }, -- Light Brown (plain)
    ["tiramisu"] = { r = 0.65, g = 0.45, b = 0.30, a = 1 }, -- Coffee Brown
    ["kung-pao-chicken"] = { r = 0.70, g = 0.40, b = 0.20, a = 1 }, -- Reddish Brown
    ["tangyuan"] = { r = 1.00, g = 1.00, b = 1.00, a = 1 }, -- White
    ["dumpling"] = { r = 0.95, g = 0.90, b = 0.80, a = 1 }, -- Pale Beige
    ["fried-chicken"] = { r = 0.90, g = 0.75, b = 0.50, a = 1 }, -- Golden Brown
    ["braised-pork"] = { r = 0.60, g = 0.30, b = 0.20, a = 1 }, -- Dark Reddish Brown
    ["cucumber-salad"] = { r = 0.60, g = 0.80, b = 0.40, a = 1 }, -- Light Green
    ["mapo-tofu"] = { r = 0.80, g = 0.30, b = 0.20, a = 1 }, -- Reddish Brown (with some white from tofu)
    ["carrot-juice"] = { r = 0.90, g = 0.50, b = 0.00, a = 1 }, -- Orange
    ["cola"] = { r = 0.30, g = 0.15, b = 0.00, a = 1 }, -- Dark Brown
    ["pudding"] = { r = 0.95, g = 0.90, b = 0.70, a = 1 }, -- Pale Yellow (assuming vanilla)
    ["chocolate-milkshake"] = { r = 0.60, g = 0.40, b = 0.20, a = 1 }, -- Chocolate Brown
}

for name, color in pairs(items) do

    if data.raw.item[name] then
        data.raw.item[name] = nil
    end

    if data.raw.capsule[name] then
        data.raw.capsule[name] = nil
    end

    data:extend({
        {
            type = "item",
            name = name,
            icon = "__fruit__/graphics/icon/" .. name .. ".png",
            icon_size = 512,
            subgroup = "fruit_product",
            order = "a[" .. name .. "]",
            spoil_ticks = feature_flags["spoiling"] and 12 * minute or nil,
            stack_size = 100,
        },
    })


    if not data.raw.recipe[name] then

        RECIPE {
            type = "recipe",
            name = name,
            enabled = false,
            category = "farming",
            crafting_machine_tint = { primary = color },
            energy_required = 3600,
            ingredients = {
                { type = "item", name = name, amount = 1 },
                { type = "fluid", name = "water", amount = 200 },
            },
            results = { { type = "item", name = name, amount = 2 } },
        }:add_unlock("animal-husbandry")
    end

    --table.insert(orders_recipe.restaurant, name)

end


--
--
--data:extend({
--    {
--        type = "item",
--        name = "milk",
--        icon = "__fruit__/graphics/icon/milk.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[milk]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "milk",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="milk", amount=1}},
--        results = {{type="item", name="milk", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "egg",
--        icon = "__fruit__/graphics/icon/egg.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[egg]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "egg",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="egg", amount=1}},
--        results = {{type="item", name="egg", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "pork",
--        icon = "__fruit__/graphics/icon/pork.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[pork]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "pork",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="pork", amount=1}},
--        results = {{type="item", name="pork", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "honey",
--        icon = "__fruit__/graphics/icon/honey.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[honey]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "honey",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="honey", amount=1}},
--        results = {{type="item", name="honey", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "feather",
--        icon = "__fruit__/graphics/icon/feather.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[feather]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "feather",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="feather", amount=1}},
--        results = {{type="item", name="feather", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "leather",
--        icon = "__fruit__/graphics/icon/leather.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[leather]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "leather",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="leather", amount=1}},
--        results = {{type="item", name="leather", amount=2}},
--
--    }
--})
--
--
--
--if data.raw.capsule["cheese"] then
--    data.raw.capsule["cheese"] = nil
--end
--
--data:extend({
--    {
--        type = "item",
--        name = "cheese",
--        icon = "__fruit__/graphics/icon/cheese.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[cheese]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "cheese",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="cheese", amount=1}},
--        results = {{type="item", name="cheese", amount=2}},
--
--    }
--})
--
--
--
--data:extend({
--    {
--        type = "item",
--        name = "beef",
--        icon = "__fruit__/graphics/icon/beef.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[beef]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "beef",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="beef", amount=1}},
--        results = {{type="item", name="beef", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "chicken_meat",
--        icon = "__fruit__/graphics/icon/chicken_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[chicken_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "chicken_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="chicken_meat", amount=1}},
--        results = {{type="item", name="chicken_meat", amount=2}},
--
--    }
--})
--
--
--data:extend({
--    {
--        type = "item",
--        name = "duck_egg",
--        icon = "__fruit__/graphics/icon/duck_egg.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[duck_egg]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "duck_egg",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="duck_egg", amount=1}},
--        results = {{type="item", name="duck_egg", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "rabbit_pelt",
--        icon = "__fruit__/graphics/icon/rabbit_pelt.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[rabbit_pelt]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "rabbit_pelt",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="rabbit_pelt", amount=1}},
--        results = {{type="item", name="rabbit_pelt", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "turkey_meat",
--        icon = "__fruit__/graphics/icon/turkey_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[turkey_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "turkey_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="turkey_meat", amount=1}},
--        results = {{type="item", name="turkey_meat", amount=2}},
--
--    }
--})
--
--
--data:extend({
--    {
--        type = "item",
--        name = "goose_feather",
--        icon = "__fruit__/graphics/icon/goose_feather.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[goose_feather]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "goose_feather",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="goose_feather", amount=1}},
--        results = {{type="item", name="goose_feather", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "ostrich_egg",
--        icon = "__fruit__/graphics/icon/ostrich_egg.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[ostrich_egg]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "ostrich_egg",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="ostrich_egg", amount=1}},
--        results = {{type="item", name="ostrich_egg", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "quail_egg",
--        icon = "__fruit__/graphics/icon/quail_egg.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[quail_egg]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "quail_egg",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="quail_egg", amount=1}},
--        results = {{type="item", name="quail_egg", amount=2}},
--
--    }
--})
--
--
--data:extend({
--    {
--        type = "item",
--        name = "lamb_meat",
--        icon = "__fruit__/graphics/icon/lamb_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[lamb_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "lamb_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="lamb_meat", amount=1}},
--        results = {{type="item", name="lamb_meat", amount=2}},
--
--    }
--})
--
--
--data:extend({
--    {
--        type = "item",
--        name = "duck_meat",
--        icon = "__fruit__/graphics/icon/duck_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[duck_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "duck_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="duck_meat", amount=1}},
--        results = {{type="item", name="duck_meat", amount=2}},
--
--    }
--})
--
--data:extend({
--    {
--        type = "item",
--        name = "turkey_feather",
--        icon = "__fruit__/graphics/icon/turkey_feather.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[turkey_feather]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "turkey_feather",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="turkey_feather", amount=1}},
--        results = {{type="item", name="turkey_feather", amount=2}},
--
--    }
--})

--data:extend({
--    {
--        type = "item",
--        name = "ostrich_meat",
--        icon = "__fruit__/graphics/icon/ostrich_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[ostrich_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "ostrich_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="ostrich_meat", amount=1}},
--        results = {{type="item", name="ostrich_meat", amount=2}},
--
--    }
--})

--data:extend({
--    {
--        type = "item",
--        name = "bison_meat",
--        icon = "__fruit__/graphics/icon/bison_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[bison_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "bison_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="bison_meat", amount=1}},
--        results = {{type="item", name="bison_meat", amount=2}},
--
--    }
--})


--data:extend({
--    {
--        type = "item",
--        name = "goose_meat",
--        icon = "__fruit__/graphics/icon/goose_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[goose_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "goose_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="goose_meat", amount=1}},
--        results = {{type="item", name="goose_meat", amount=2}},
--
--    }
--})

--data:extend({
--    {
--        type = "item",
--        name = "llama_fleece",
--        icon = "__fruit__/graphics/icon/llama_fleece.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[llama_fleece]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "llama_fleece",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="llama_fleece", amount=1}},
--        results = {{type="item", name="llama_fleece", amount=2}},
--
--    }
--})

--data:extend({
--    {
--        type = "item",
--        name = "goat_meat",
--        icon = "__fruit__/graphics/icon/goat_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[goat_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "goat_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="goat_meat", amount=1}},
--        results = {{type="item", name="goat_meat", amount=2}},
--
--    }
--})

--data:extend({
--    {
--        type = "item",
--        name = "alpaca_meat",
--        icon = "__fruit__/graphics/icon/alpaca_meat.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[alpaca_meat]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "alpaca_meat",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="alpaca_meat", amount=1}},
--        results = {{type="item", name="alpaca_meat", amount=2}},
--
--    }
--})


--data:extend({
--    {
--        type = "item",
--        name = "goat_milk",
--        icon = "__fruit__/graphics/icon/goat_milk.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[goat_milk]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "goat_milk",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="goat_milk", amount=1}},
--        results = {{type="item", name="goat_milk", amount=2}},
--
--    }
--})


--data:extend({
--    {
--        type = "item",
--        name = "bison_leather",
--        icon = "__fruit__/graphics/icon/bison_leather.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[bison_leather]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "bison_leather",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="bison_leather", amount=1}},
--        results = {{type="item", name="bison_leather", amount=2}},
--
--    }
--})


--data:extend({
--    {
--        type = "item",
--        name = "alpaca_fleece",
--        icon = "__fruit__/graphics/icon/alpaca_fleece.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[alpaca_fleece]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "alpaca_fleece",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="alpaca_fleece", amount=1}},
--        results = {{type="item", name="alpaca_fleece", amount=2}},
--
--    }
--})

--data:extend({
--    {
--        type = "item",
--        name = "sheep_milk",
--        icon = "__fruit__/graphics/icon/sheep_milk.png",
--        icon_size = 512,
--        subgroup = "animal_products",
--        order = "a[sheep_milk]",
--        stack_size = 100 ,
--    },
--    {
--        type = "recipe",
--        name = "sheep_milk",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { {type="item", name="sheep_milk", amount=1}},
--        results = {{type="item", name="sheep_milk", amount=2}},
--
--    }
--})
