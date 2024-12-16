-- 定义小麦处理链的配方
local wheatProcessingRecipes = {
    --{ name = "wheat-drying", ingredients = { { "wheat", 1 } }, result = "dried-wheat", result_count = 1, machine = "drying" },
    { name = "wheat-peeling", ingredients = { { "dried-wheat", 1 } }, result = "peeled-wheat", result_count = 1, machine = "husker" },
    { name = "wheat-milling", ingredients = { { "peeled-wheat", 2 } }, result = "flour", result_count = 1, machine = "grinder" },
    --{ name = "flour-baking", ingredients = { { "wheat-flour", 1 }, { "water", 1 } }, result = "bread", result_count = 1, machine = "oven" },
}

-- 添加配方到游戏中
for _, recipe in ipairs(wheatProcessingRecipes) do
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
            main_product =  recipe.result,
            enabled = false,
            category = recipe.machine,
        }
    })
end

-- 创建新物品
local items = {
    "wheat",
    "dried-wheat",
    "peeled-wheat",
    "wheat-flour",
    "bread",
}

