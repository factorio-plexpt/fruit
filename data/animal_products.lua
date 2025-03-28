local enable_recipe = settings.startup["fruit-recipe-enable"].value

local animal_products = {
    milk = { r = 0.98, g = 0.98, b = 0.94, a = 1 }, -- Grey 50
    egg = { r = 0.98, g = 0.96, b = 0.9, a = 1 }, -- Grey 100
    ["cow-egg"] = { r = 0.98, g = 0.96, b = 0.9, a = 1 }, -- Grey 100
    ["sheep-egg"] = { r = 0.98, g = 0.96, b = 0.9, a = 1 }, -- Grey 100
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

local excludes = {
    ["cow-egg"] = true,
    ["sheep-egg"] = true,
    feather = true,
    leather = true,
    rabbit_pelt = true,
    goose_feather = true,
    turkey_feather = true,
}

for name, color in pairs(animal_products) do

    if data.raw.item[name] then
        data.raw.item[name] = nil
    end

    if data.raw.capsule[name] then
        data.raw.capsule[name] = nil
    end

    local spoil_ticks = feature_flags["spoiling"] and 12 * minute or nil
    -- 检查字符串是否以 "egg" 结尾

    if string.match(name, "egg$") then
        spoil_ticks = nil
    end
    data:extend({
        {
            type = "item",
            name = name,
            icon = "__fruit__/graphics/icon/" .. name .. ".png",
            icon_size = 512,
            subgroup = "animal_products",
            order = "a[" .. name .. "]",
            spoil_ticks = spoil_ticks,
            spoil_result = mods["space-age"] and "spoilage" or nil,
            stack_size = 100,
        },
    })

    if not excludes[name] then
        table.insert(orders_recipe.restaurant, name)
    end

end


--
