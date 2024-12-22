-- 定义咖啡生产链的配方
local coffeeRecipes = {
    { name = "coffee-seed-fermentation", ingredients = { { "coffee-seed", 1 } }, result = "fermented-coffee-seed", result_count = 1, machine = "fermentation" },
    --{ name = "coffee-seed-drying", ingredients = { { "fermented-coffee-seed", 1 } }, result = "dried-coffee-seed", result_count = 1, machine = "dryer" },
    { name = "coffee-seed-roasting", ingredients = { { "dried-coffee-seed", 1 } }, result = "coffee-bean", result_count = 1, machine = "oven" },
    { name = "coffee-powder-grinding", ingredients = { { "coffee-bean", 1 } }, result = "coffee-powder", result_count = 1, machine = "grinder" },
    { name = "coffee", ingredients = { { "coffee-powder", 1 }, { "water", 1 } }, result = "coffee", result_count = 1, machine = "agitator" },
}

-- 添加配方到游戏中
for _, recipe in ipairs(coffeeRecipes) do
    local ingredients = {}
    for _, ingredient in pairs(recipe.ingredients) do
        local item = { type = "item", name = ingredient[1], amount = ingredient[2] }
        if ingredient[1] == "water" then
            item.type = "fluid"
        end
        table.insert(ingredients, item)
    end

    data:extend({
        {
            type = "recipe",
            name = recipe.name,
            ingredients = ingredients,
            results = { { type = "item", name = recipe.result, amount = recipe.result_count } },
            energy_required = 2,
            main_product = recipe.result,
            enabled = false,
            category = recipe.machine,
        }
    })
end

-- 创建新物品
local items = {
    "coffee-seed",
    "fermented-coffee-seed",
    "dried-coffee-seed",
    "coffee-bean",
    "coffee-powder",
    "brewed-coffee",
    "bottled-coffee",
}

local function add_item(item)

end

for _, item in ipairs(items) do
    add_item(item)
end

-- 定义科技
local coffeeTechnologies = {

}
