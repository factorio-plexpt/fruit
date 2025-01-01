-- 定义土豆生产链的配方
local potatoRecipes = {
    { name = "potato-washing", ingredients = { { "potato", 1 }, { "water", 1 } }, result = "washed-potato", result_count = 1, machine = "washer" },
    { name = "potato-peeling", ingredients = { { "washed-potato", 1 } }, result = "peeled-potato", result_count = 1, machine = "cutting" },
    { name = "potato-slicing", ingredients = { { "peeled-potato", 1 } }, result = "potato-slice", result_count = 3, machine = "cutting" }, -- 一个土豆切成多片
    { name = "potato-shredding", ingredients = { { "peeled-potato", 1 } }, result = "potato-shred", result_count = 5, machine = "cutting" }, -- 一个土豆切成更多丝
    { name = "potato-dicing", ingredients = { { "peeled-potato", 1 } }, result = "potato-dice", result_count = 4, machine = "cutting" }, -- 一个土豆切成多个丁
    { name = "potato-frying-slices", ingredients = { { "potato-slice", 3 }, { "olive_oil", 1 } }, result = "potato-chip", result_count = 4, machine = "pot" }, -- 用土豆片油炸
    { name = "potato-frying-shreds", ingredients = { { "potato-shred", 5 }, { "olive_oil", 1 } }, result = "french-fries", result_count = 6, machine = "pot" }, -- 用土豆丝油炸
    { name = "mashed-potato-making", ingredients = { { "potato-dice", 3 }, { "milk", 1 } , { "butter", 1 } }, result = "mashed-potatoes", result_count = 1, machine = "grinder" }, -- 去皮土豆和牛奶制作土豆泥
    { name = "baked-potato-making", ingredients = { { "washed-potato", 1 } }, result = "baked-potato", result_count = 1, machine = "bbq" }, -- 清洗后的土豆直接烘烤
}

-- 添加配方到游戏中
for _, recipe in ipairs(potatoRecipes) do
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
            energy_required = 2, -- 可以根据实际情况调整
            main_product = recipe.result,
            enabled = false, -- 默认禁用，可以通过科技解锁
            category = recipe.machine,
        }
    })
end

-- 创建新物品
local potatoItems = {
    "potato",
    "washed-potato",
    "peeled-potato",
    "potato-slice",
    "potato-shred",
    "potato-dice",
    "potato-chip",
    "fried-potato-shreds",
    "mashed-potato",
    "baked-potato",
}

-- 定义科技 (示例)
local potatoTechnologies = {
    {
        type = "technology",
        name = "potato-processing",
        unit_cost = 20,
        upgrade_cost = 100,
        prerequisites = { "automation" },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "potato-washing"
            },
            {
                type = "unlock-recipe",
                recipe = "potato-peeling"
            }
        },
        order = "a-a-a"
    },
    {
        type = "technology",
        name = "advanced-potato-processing",
        unit_cost = 30,
        upgrade_cost = 150,
        prerequisites = { "potato-processing" },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "potato-slicing"
            },
            {
                type = "unlock-recipe",
                recipe = "potato-shredding"
            },
            {
                type = "unlock-recipe",
                recipe = "potato-dicing"
            },
            {
                type = "unlock-recipe",
                recipe = "potato-frying-slices"
            },
            {
                type = "unlock-recipe",
                recipe = "potato-frying-shreds"
            },
            {
                type = "unlock-recipe",
                recipe = "mashed-potato-making"
            },
            {
                type = "unlock-recipe",
                recipe = "baked-potato-making"
            }
        },
        order = "a-a-b"
    }
}


