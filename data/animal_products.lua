local enable_recipe = settings.startup["fruit-recipe-enable"].value

local animal_products = {
    milk = { r = 0.98, g = 0.98, b = 0.94, a = 1 }, -- Grey 50
    egg = { r = 0.98, g = 0.96, b = 0.9, a = 1 }, -- Grey 100
    pork = { r = 0.93, g = 0.8, b = 0.73, a = 1 }, -- Brown 100
    honey = { r = 1, g = 0.8, b = 0, a = 1 }, -- Amber 500
    feather = { r = 0.9, g = 0.9, b = 0.9, a = 1 }, -- Grey 100
    leather = { r = 0.6, g = 0.4, b = 0.2, a = 1 }, -- Brown 700
    cheese = { r = 1, g = 0.9, b = 0.4, a = 1 }, -- Amber 300
    beef = { r = 0.6, g = 0.1, b = 0, a = 1 }, -- Red 900
    chicken_meat = { r = 0.95, g = 0.85, b = 0.7, a = 1 }, -- Brown 50
    duck_egg = { r = 0.95, g = 0.9, b = 0.8, a = 1 }, -- Grey 200
    rabbit_pelt = { r = 0.7, g = 0.5, b = 0.3, a = 1 }, -- Brown 600
    turkey_meat = { r = 0.85, g = 0.7, b = 0.5, a = 1 }, -- Brown 300
    goose_feather = { r = 0.92, g = 0.94, b = 0.9, a = 1 }, -- Grey 100
    ostrich_egg = { r = 0.9, g = 0.85, b = 0.75, a = 1 }, -- Brown 100
    quail_egg = { r = 0.9, g = 0.88, b = 0.8, a = 1 }, -- Grey 200
    lamb_meat = { r = 0.75, g = 0.5, b = 0.4, a = 1 }, -- Brown 400
    duck_meat = { r = 0.7, g = 0.5, b = 0.3, a = 1 }, -- Brown 600
    turkey_feather = { r = 0.8, g = 0.7, b = 0.6, a = 1 }, -- Brown 200
}

for name, color in pairs(animal_products) do

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
            subgroup = "animal_products",
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
