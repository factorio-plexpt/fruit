-- 定义巧克力生产链的步骤
local chocolateProductionChain = {
    { name = "收获可可豆", input = nil, output = "可可豆", machine = "种植园" },
    { name = "发酵可可豆", input = "可可豆", output = "发酵可可豆", machine = "发酵桶" },
    { name = "干燥可可豆", input = "发酵可可豆", output = "干燥可可豆", machine = "干燥机" },
    { name = "烘焙可可豆", input = "干燥可可豆", output = "烘焙可可豆", machine = "烘焙炉" },
    { name = "研磨可可豆", input = "烘焙可可豆", output = "可可浆", machine = "研磨机" },
    { name = "精炼巧克力液", input = "可可浆", output = "精炼巧克力液", machine = "精炼机" },
    { name = "调温巧克力液", input = "精炼巧克力液", output = "调温巧克力液", machine = "调温机" },
    { name = "巧克力成型", input = "调温巧克力液", output = "巧克力块", machine = "模具机" },
    { name = "巧克力包装", input = "巧克力块", output = "包装巧克力", machine = "包装机" }
}

-- 定义巧克力生产链的配方
local chocolateRecipes = {
    { name = "cocoa-bean-extraction", ingredients = { { "cocoa-pod", 1 } }, result = "cocoa-bean", result_count = 1, "husker" },
    { name = "cocoa-bean-fermentation", ingredients = { { "cocoa-bean", 1 } }, result = "fermented-cocoa-bean", result_count = 1, machine = "fermentation" },
    --{ name = "cocoa-bean-drying", ingredients = { { "fermented-cocoa-bean", 1 } }, result = "dried-cocoa-bean", result_count = 1, machine = "spo" },
    { name = "cocoa-bean-roasting", ingredients = { { "dried-cocoa-bean", 1 } }, result = "roasted-cocoa-bean", result_count = 1, machine = "oven" },
    { name = "cocoa-powder-grinding", ingredients = { { "roasted-cocoa-bean", 1 } }, result = "cocoa-powder", result_count = 1, machine = "grinder" },
    { name = "cocoa-liquor", ingredients = { { "cocoa-powder", 1 }, { "water", 1 } }, result = "cocoa-liquor", result_count = 1, machine = "agitator" },
    { name = "refined-chocolate", ingredients = { { "cocoa-liquor", 1 } }, result = "refined-chocolate", result_count = 1, machine = "pot" },
    { name = "chocolate-bar-molding", ingredients = { { "refined-chocolate", 1 } }, result = "chocolate", result_count = 1, machine = "press" },
}

-- 添加配方到游戏中
for _, recipe in ipairs(chocolateRecipes) do
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
    "cocoa-pod",
    "cocoa-bean",
    "fermented-cocoa-bean",
    "dried-cocoa-bean",
    "roasted-cocoa-bean",
    "cocoa-powder",
    "cocoa-liquor",
    "refined-chocolate",
}

local function add_item(item)

end

for _, item in ipairs(items) do
    add_item(item)
end



-- 定义科技
local chocolateTechnologies = {
    {
        type = "technology",
        name = "chocolate-processing",
        icon = "__fruit__/graphics/icon/chocolate.png",
        icon_size = 512,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-extraction"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-fermentation"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-drying"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-bean-roasting"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-powder-grinding"
            },
            {
                type = "unlock-recipe",
                recipe = "cocoa-liquor"
            },
            {
                type = "unlock-recipe",
                recipe = "refined-chocolate"
            },
            {
                type = "unlock-recipe",
                recipe = "chocolate-bar-molding"
            },
        },
        prerequisites = {"wheat-processing"},
        unit = {
            count = 500,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 5
        },
    },
}
