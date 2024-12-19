-- 定义羊毛处理链的配方
local woolProcessingRecipes = {
    { name = "wool-cleaning", ingredients = { { "wool", 1 }, {"water", 2} }, result = "cleaned-wool", result_count = 1, machine = "washer" },
    --{ name = "wool-drying", ingredients = { { "cleaned-wool", 1 } }, result = "dried-wool", result_count = 1, machine = "drying" },
    { name = "wool-spinning", ingredients = { { "dried-wool", 1 } }, result = "yarn", result_count = 1, machine = "agitator" },
}

-- 添加配方到游戏中
for _, recipe in ipairs(woolProcessingRecipes) do
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
    "raw-wool",
    "cleaned-wool",
    "dried-wool",
    "wool-yarn",
}

-- 定义科技
local woolTechnologies = {
    {
        type = "technology",
        name = "wool-processing",
        icon = "__fruit__/graphics/icon/wool-processing.png",
        icon_size = 128,
        effects = {
            { type = "unlock-recipe", recipe = "wool-cleaning" },
            { type = "unlock-recipe", recipe = "wool-spinning" },
        },
        prerequisites = { "basic-processing" },
        unit = {
            count = 100,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
            },
            time = 5,
        },
    },
}
