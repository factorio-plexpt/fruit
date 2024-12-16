-- 定义稻谷处理链的配方
local riceProcessingRecipes = {
    { name = "rice-husking", ingredients = { { "dried-rice", 1 } }, result = "rice", result_count = 1, machine = "husker" },
    { name = "rice-flour-grinding", ingredients = { { "rice", 1 } }, result = "rice-flour", result_count = 1, machine = "grinder" },
}

-- 添加配方到游戏中
for _, recipe in ipairs(riceProcessingRecipes) do
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
    "rice-grain",
    "dried-rice",
    "rice",
    "rice-flour",
}
