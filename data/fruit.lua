local enable_recipe = settings.startup["fruit-recipe-enable"].value

local fruit = {
    apple = { r = 1, g = 0, b = 0, a = 0.6 }, -- Red
    banana = { r = 1, g = 1, b = 0, a = 0.6 }, -- Yellow
    orange = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Orange
    strawberry = { r = 1, g = 0, b = 0.2, a = 0.6 }, -- Deep Red/Pink
    watermelon = { r = 0, g = 0.5, b = 0, a = 0.6 }, -- Green (rind) / {r=1, g=0, b=0, a=0.6} (flesh) - I'll use rind for simplicity here
    pear = { r = 0.8, g = 1, b = 0, a = 0.6 }, -- Yellow-Green
    kiwi = { r = 0.3, g = 0.6, b = 0.2, a = 0.6 }, -- Green-Brown
    pineapple = { r = 1, g = 0.8, b = 0, a = 0.6 }, -- Yellow-Orange
    grape = { r = 0.5, g = 0, b = 0.5, a = 0.6 }, -- Purple/Green (depending on variety, using purple here)
    peach = { r = 1, g = 0.7, b = 0.3, a = 0.6 }, -- Pink-Orange
    mango = { r = 1, g = 0.6, b = 0, a = 0.6 }, -- Yellow-Orange
    papaya = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Orange
    blueberry = { r = 0, g = 0, b = 1, a = 0.6 }, -- Blue
    plum = { r = 0.5, g = 0, b = 0.5, a = 0.6 }, -- Purple
    pomegranate = { r = 0.6, g = 0, b = 0, a = 0.6 }, -- Deep Red
    jackfruit = { r = 0.8, g = 0.6, b = 0.2, a = 0.6 }, -- Yellow-Greenish Brown
    lychee = { r = 1, g = 0.8, b = 0.8, a = 0.6 }, -- Pinkish White
    raspberry = { r = 1, g = 0.2, b = 0.2, a = 0.6 }, -- Red-Pink
    blackberry = { r = 0.1, g = 0.1, b = 0.1, a = 0.6 }, -- Very Dark Purple/Black
    dragon_fruit = { r = 1, g = 0.8, b = 0.8, a = 0.6 }, -- Pink (flesh) / {r=0.8, g=0, b=0.2, a=0.6} (skin) - Using flesh here
    cantaloupe = { r = 1, g = 0.7, b = 0.4, a = 0.6 }, -- Light Orange
    passion_fruit = { r = 0.6, g = 0.2, b = 0, a = 0.6 }, -- Dark Purple/Brownish
    cherry = { r = 0.8, g = 0, b = 0, a = 0.6 }, -- Red
    --tangerine = { r = 1, g = 0.6, b = 0, a = 0.6 }, -- Orange
    guava = { r = 0.7, g = 0.9, b = 0.5, a = 0.6 }, -- Light Green
    carambola = { r = 1, g = 0.9, b = 0.2, a = 0.6 }, -- Yellow
    coconut = { r = 0.8, g = 0.7, b = 0.5, a = 0.6 }, -- Brown/White (using brownish here)
    rambutan = { r = 1, g = 0.2, b = 0.2, a = 0.6 }, -- Red
    durian = { r = 0.9, g = 0.8, b = 0.2, a = 0.6 }, -- Yellow-Green
    longan = { r = 0.7, g = 0.5, b = 0.3, a = 0.6 }, -- Brown
    fig = { r = 0.5, g = 0.1, b = 0.3, a = 0.6 }, -- Purple/Brownish
    sapodilla = { r = 0.6, g = 0.4, b = 0.2, a = 0.6 }, -- Brown
    apricot = { r = 1, g = 0.7, b = 0.3, a = 0.6 }, -- Orange-Yellow
    cranberry = { r = 0.7, g = 0, b = 0.1, a = 0.6 }, -- Deep Red
    persimmon = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Orange
    elderberry = { r = 0.2, g = 0, b = 0.4, a = 0.6 }, -- Dark Purple
    currant = { r = 0.6, g = 0, b = 0, a = 0.6 }, -- Red
    loquat = { r = 1, g = 0.8, b = 0.4, a = 0.6 }, -- Orange-Yellow
    mulberry = { r = 0.3, g = 0, b = 0.3, a = 0.6 }, -- Dark Purple
    lemon = { r = 1, g = 1, b = 0, a = 0.6 }, -- Yellow
    grapefruit = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Pink-Orange
    prune = { r = 0.2, g = 0, b = 0.2, a = 0.6 }, -- Dark Purple
    mangosteen = { r = 0.5, g = 0, b = 0.5, a = 0.6 }, -- Dark Purple (rind) / White (flesh) - Using rind here
    bayberry = { r = 0.4, g = 0, b = 0.1, a = 0.6 }, -- Dark Red/Purple
    olive = { r = 0.4, g = 0.4, b = 0, a = 0.6 }, -- Green/Black (using greenish here)
    avocado = { r = 0.3, g = 0.5, b = 0.1, a = 0.6 }, -- Green
    sugarcane = { r = 0.8, g = 0.7, b = 0.4, a = 0.6 }, -- Light Brown
}

for name, color in pairs(fruit) do

    if data.raw.item[name] then
        data.raw.item[name] = nil
    end

    if data.raw.capsule[name] then
        data.raw.capsule[name] = nil
    end

    ITEM {
        type = "item",
        name = name,
        icon = "__fruit__/graphics/fruit/" .. name .. ".png",
        icon_size = 512,
        fuel_value = "1MJ",
        burnt_result = "ash",
        fuel_category = "fruit",
        subgroup = "fruit",
        order = "a[" .. name .. "]",
        spoil_ticks = feature_flags["spoiling"] and 10 * minute or nil,
        spoil_result = mods["space-age"] and "spoilage" or nil,
        stack_size = 100,
    }
    if not data.raw.recipe[name] then
        RECIPE {
            type = "recipe",
            name = name,
            enabled = false,
            category = "fruit_plant",
            crafting_machine_tint = { primary = color },
            energy_required = 3600,
            ingredients = {
                { type = "item", name = name, amount = 1 },
                { type = "fluid", name = "water", amount = 200 },
            },
            results = { { type = "item", name = name, amount = 2 } },
        }:add_unlock("fruit-cultivation")
    end

    --table.insert(orders_recipe.restaurant, name)

end


--data:extend({
--    {
--        type = "item",
--        name = "apple",
--        icon = "__fruit__/graphics/fruit/apple.png",
--        icon_size = 512,
--        subgroup = "fruit",
--        order = "a[apple]",
--        stack_size = 100,
--    },
--    {
--        type = "recipe",
--        name = "apple",
--        enabled = enable_recipe,
--        energy_required = 600,
--        ingredients = { { type = "item", name = "apple", amount = 1 } },
--        results = { { type = "item", name = "apple", amount = 2 } },
--
--    }
--})
--
