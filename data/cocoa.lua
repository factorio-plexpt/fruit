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

-- 模拟巧克力生产过程
function produceChocolate()
    local currentInput = nil
    for i, step in ipairs(chocolateProductionChain) do
        print(string.format("步骤 %d: %s", i, step.name))
        print(string.format("输入: %s", step.input or "无"))
        print(string.format("输出: %s", step.output))
        print(string.format("使用机器: %s", step.machine))
        print("")

        -- 更新当前输入为当前步骤的输出
        currentInput = step.output
    end
    print("巧克力生产完成！")
end

-- 执行巧克力生产过程
produceChocolate()


-- 定义巧克力生产链的配方
local chocolateRecipes = {
    --{ name = "cocoa_bean", ingredients = {}, result = "cocoa-bean", result_count = 1 },
    { name = "fermented_cocoa_bean", ingredients = { { type = "item", amount = 1, name = "cocoa-bean" } }, result = "fermented-cocoa-bean", result_count = 1 , machine = "发酵桶"},
    { name = "dried_cocoa_bean", ingredients = { { type = "item", amount = 1, name = "fermented-cocoa-bean" } }, result = "dried-cocoa-bean", result_count = 1 , machine = "干燥机" },
    { name = "roasted_cocoa_bean", ingredients = { { type = "item", amount = 1, name = "dried-cocoa-bean" } }, result = "roasted-cocoa-bean", result_count = 1, machine = "烘焙炉" },
    { name = "cocoa_liquor", ingredients = { { type = "item", amount = 1, name = "roasted-cocoa-bean" } }, result = "cocoa-liquor", result_count = 1, machine = "研磨机" },
    { name = "refined_chocolate", ingredients = { { type = "item", amount = 1, name = "cocoa-liquor" } }, result = "refined-chocolate", result_count = 1 , machine = "精炼机"},
    { name = "tempered_chocolate", ingredients = { { type = "item", amount = 1, name = "refined-chocolate" } }, result = "tempered-chocolate", result_count = 1, machine = "调温机" },
    { name = "chocolate_bar", ingredients = { { type = "item", amount = 1, name = "tempered-chocolate" } }, result = "chocolate-bar", result_count = 1 , machine = "模具机"},
    { name = "packaged_chocolate", ingredients = { { type = "item", amount = 1, name = "chocolate-bar" } }, result = "packaged-chocolate", result_count = 1, machine = "包装机" }
}
-- 添加配方到游戏中
for _, recipe in ipairs(chocolateRecipes) do
    data:extend({
        {
            type = "recipe",
            name = recipe.name,
            ingredients = recipe.ingredients,
            results = { { type = "item", name = recipe.result, amount = recipe.result_count } },
        }
    })
end

-- 创建新物品
local items = {
    "cocoa-bean",
    "fermented-cocoa-bean",
    "dried-cocoa-bean",
    "roasted-cocoa-bean",
    "cocoa-liquor",
    "refined-chocolate",
    "tempered-chocolate",
    "chocolate-bar",
    "packaged-chocolate"
}

for _, item in ipairs(items) do
    data:extend({
        {
            type = "item",
            name = item,
            icon = "__your_mod_name__/graphics/icons/" .. item .. ".png",
            icon_size = 32,
            subgroup = "raw-material",
            order = "a[" .. item .. "]",
            stack_size = 100
        }
    })
end
