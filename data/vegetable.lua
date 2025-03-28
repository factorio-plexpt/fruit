local enable_recipe = settings.startup["fruit-recipe-enable"].value

local items = {
    carrot = { r = 0.93, g = 0.69, b = 0.13, a = 1 }, -- Deep Orange A700
    cucumber = { r = 0.6, g = 0.8, b = 0.19, a = 1 }, -- Light Green A700
    spinach = { r = 0.3, g = 0.7, b = 0.16, a = 1 }, -- Green 800
    tomato = { r = 0.91, g = 0.12, b = 0.39, a = 1 }, -- Red 500
    broccoli = { r = 0.38, g = 0.74, b = 0.24, a = 1 }, -- Light Green 600
    lettuce = { r = 0.76, g = 0.86, b = 0.42, a = 1 }, -- Lime 400
    bell_pepper = { r = 1, g = 0.87, b = 0, a = 1 }, -- Amber A400 (Yellow bell pepper)
    zucchini = { r = 0.57, g = 0.77, b = 0.41, a = 1 }, -- Light Green 800
    onion = { r = 0.96, g = 0.85, b = 0.63, a = 1 }, -- Amber 100
    garlic = { r = 0.97, g = 0.92, b = 0.84, a = 1 }, -- Grey 200
    pumpkin = { r = 1, g = 0.58, b = 0, a = 1 }, -- Orange 900
    cabbage = { r = 0.45, g = 0.67, b = 0.3, a = 1 }, -- Green 700
    eggplant = { r = 0.55, g = 0.25, b = 0.6, a = 1 }, -- Deep Purple 500
    potato = { r = 0.76, g = 0.69, b = 0.5, a = 1 }, -- Brown 300
    sweet_potato = { r = 0.95, g = 0.64, b = 0.38, a = 1 }, -- Deep Orange 500
    beetroot = { r = 0.7, g = 0.18, b = 0.3, a = 1 }, -- Deep Purple A400
    asparagus = { r = 0.47, g = 0.79, b = 0.44, a = 1 }, -- Light Green 500
    pea = { r = 0.6, g = 0.7, b = 0.3, a = 1 }, -- Green 600
    celery = { r = 0.65, g = 0.77, b = 0.4, a = 1 }, -- Light Green 700
    artichoke = { r = 0.4, g = 0.6, b = 0.3, a = 1 }, -- Green 800
    brussels_sprout = { r = 0.4, g = 0.65, b = 0.35, a = 1 }, -- Green 700
    parsnip = { r = 0.93, g = 0.84, b = 0.66, a = 1 }, -- Amber 50
    leek = { r = 0.6, g = 0.75, b = 0.45, a = 1 }, -- Light Green 600
    turnip = { r = 0.88, g = 0.86, b = 0.76, a = 1 }, -- Grey 100
    cauliflower = { r = 0.95, g = 0.95, b = 0.95, a = 1 }, -- Grey 50
    okra = { r = 0.3, g = 0.5, b = 0.2, a = 1 }, -- Green 900
    daikon = { r = 0.97, g = 0.98, b = 0.95, a = 1 }, -- Grey 50
    jicama = { r = 0.8, g = 0.75, b = 0.6, a = 1 }, -- Brown 200
    chayote = { r = 0.7, g = 0.8, b = 0.5, a = 1 }, -- Light Green 500
    kale = { r = 0.2, g = 0.5, b = 0.2, a = 1 }, -- Green 900
    corn = { r = 1, g = 0.92, b = 0.31, a = 1 }, -- Amber 200
    wheat = { r = 0.9, g = 0.8, b = 0.5, a = 1 }, -- Amber 300
    soybeans = { r = 0.7, g = 0.6, b = 0.4, a = 1 }, -- Brown 400
    chili = { r = 0.95, g = 0.23, b = 0.23, a = 1 }, -- Red 700
    ["cocoa-pod"] = { r = 0.65, g = 0.45, b = 0.29, a = 1 }, -- Brown 600
    ["coffee-seed"] = { r = 0.47, g = 0.33, b = 0.28, a = 1 }, -- Brown 800
    ["rice-grain"] = { r = 0.95, g = 0.94, b = 0.85, a = 1 }, -- Grey 100
    ginger = { r = 0.93, g = 0.8, b = 0.6, a = 1 }, -- Orange 100
    agave = { r = 0.2, g = 0.6, b = 0.5, a = 1 }, -- Teal 700
}

local excludes = {
    wheat = true,
    ["coffee-seed"] = true,
    ["rice-grain"] = true,
}

for name, color in pairs(items) do

    if data.raw.item[name] then
        data.raw.item[name] = nil
    end

    if data.raw.capsule[name] then
        data.raw.capsule[name] = nil
    end

    ITEM {
        type = "item",
        name = name,
        icon = "__fruit__/graphics/vegetable/" .. name .. ".png",
        icon_size = 512,
        subgroup = "vegetable",
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
            energy_required = 600,
            result_is_always_fresh = true,
            ingredients = {
                { type = "item", name = name, amount = 1 },
                { type = "fluid", name = "water", amount = 200 },
            },
            results = { { type = "item", name = name, amount = 2 } },
        }:add_unlock("vegetable-cultivation")
    end

    if not excludes[name] then
        table.insert(orders_recipe.restaurant, name)
    end

end