local items = {
    ["aa"] = { r = 0.45, g = 0.67, b = 0.3, a = 1 }, -- Green 700
}

local subgroup = "vegetable"
local recipe_category = "fruit_plant"
local icon_dir = "vegetable"

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
            icon = "__fruit__/graphics/" .. icon_dir .. "/" .. name .. ".png",
            icon_size = 512,
            subgroup = subgroup,
            order = "a[" .. name .. "]",
            spoil_ticks = feature_flags["spoiling"] and 10 * minute or nil,
            spoil_result = mods["space-age"] and "spoilage" or nil,
            stack_size = 100,
        },
    })
    if not data.raw.recipe[name] then
        RECIPE {
            type = "recipe",
            name = name,
            enabled = false,
            category = recipe_category,
            crafting_machine_tint = { primary = color },
            energy_required = 3600,
            ingredients = {
                { type = "item", name = name, amount = 1 },
                { type = "fluid", name = "water", amount = 200 },
            },
            results = { { type = "item", name = name, amount = 2 } },
        }:add_unlock("food-processing")

    end

end
