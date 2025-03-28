
local items = {
    ["coconut-milk"] = { r = 1, g = 1, b = 0.94, a = 1 }, -- Off-White
    ["vanilla-milkshake"] = { r = 0.98, g = 0.96, b = 0.93, a = 1 }, -- Light Beige
    -- ["almond-milk"] = { r = 0.97, g = 0.94, b = 0.90, a = 1 }, -- Pale Cream
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

    table.insert(orders_recipe.restaurant, name)

end