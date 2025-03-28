-- 定义一个名为 items 的局部变量，它是一个包含多个字符串的表格（数组）

local items = {
    "sugar", -- 糖
    "pie-crust", -- 馅饼皮
    "flour", -- 面粉
    "dough", -- 面团
    "pizza", -- 披萨
    "cake", -- 蛋糕
    "icecream", -- 冰淇淋
    "sushi", -- 寿司
    "sandwich", -- 三明治
    "soup", -- 汤
    "bread", -- 面包
    "cream", -- 奶油
    "corn_bread", -- 玉米面包
    "brown_sugar", -- 红糖
    "popcorn", -- 爆米花
    "butter", -- 黄油
    "bacon", -- 培根
    "cookie", -- 饼干
    "syrup", -- 糖浆
    "hamburger", -- 汉堡
    "yeast", -- 酵母
    "vinegar", -- 醋
    "soy_sauce", -- 酱油
    "olive_oil", -- 橄榄油
    "salt", -- 盐
    "chocolate", -- 巧克力
    "swiss_roll", -- 瑞士卷
    "baked-potato", -- 烤土豆
    "washed-potato", -- 洗过的土豆
    "peeled-potato", -- 削皮的土豆
    "potato-slice", -- 土豆片
    "potato-shred", -- 土豆丝
    "potato-dice", -- 土豆丁
    "potato-chip", -- 土豆片（薯片）
    "chocolate-cake", -- 巧克力蛋糕
    "french-fries", -- 薯条
    "tomato-soup", -- 番茄汤
    "caramel-apple", -- 焦糖苹果
    "toffee", -- 太妃糖
    "garlic-bread", -- 蒜香面包
    "mayonnaise", -- 蛋黄酱
    "noodles", -- 面条
    "fresh-pasta", -- 新鲜意大利面
    "grilled-asparagus", -- 烤芦笋
    "grilled-onion", -- 烤洋葱
    "fried-rice", -- 炒饭
    "mashed-potatoes", -- 土豆泥
    "rice-noodles", -- 米粉
    "zha-jiang-mian", -- 炸酱面
    "marshmallow", -- 棉花糖
    "tofu", -- 豆腐
    "taco", -- 塔可
    "spring-roll", -- 春卷
    "hot-dog", -- 热狗
    "yogurt", -- 酸奶
    "waffle", -- 华夫饼
    "chili", -- 辣椒
    "gingerbread", -- 姜饼

    "wool", -- 羊毛
    "cleaned-wool", -- 清洁过的羊毛
    "dried-wool", -- 干燥的羊毛
    "yarn", -- 纱线

    "rice-grain", -- 稻谷
    "dried-rice", -- 干米
    "rice", -- 米饭
    "rice-flour", -- 米粉

    "cocoa-pod", -- 可可豆荚
    "cocoa-bean", -- 可可豆
    "fermented-cocoa-bean", -- 发酵的可可豆
    "dried-cocoa-bean", -- 干燥的可可豆
    "roasted-cocoa-bean", -- 烘焙的可可豆
    "cocoa-powder", -- 可可粉
    "cocoa-liquor", -- 可可液
    "refined-chocolate", -- 精制巧克力

    "wheat", -- 小麦
    "dried-wheat", -- 干燥的小麦
    "peeled-wheat", -- 去皮的小麦

    "coffee-seed", -- 咖啡种子
    "fermented-coffee-seed", -- 发酵的咖啡种子
    "dried-coffee-seed", -- 干燥的咖啡种子
    "coffee-bean", -- 咖啡豆
    "coffee-powder", -- 咖啡粉
    "coffee", -- 咖啡
    "ginger", -- 姜
    "agave", -- 龙舌兰
    "ash", -- 龙舌兰
    "poop", --
    "organic-fertilizer",
}

local excludes = {
    "pie-crust",
    "yeast",
    "washed-potato",
    "peeled-potato",

    "wool",
    "cleaned-wool",
    "dried-wool",
    "yarn",

    "rice-grain",
    "dried-rice",
    "rice-flour",

    "cocoa-pod",
    "cocoa-bean",
    "fermented-cocoa-bean",
    "dried-cocoa-bean",
    "cocoa-powder",

    "wheat",
    "dried-wheat",
    "peeled-wheat",

    "coffee-seed",
    "fermented-coffee-seed",
    "dried-coffee-seed",
    "coffee-bean",
    "coffee-powder",
    "ash",
    "poop",
    "organic-fertilizer",
}

--特殊 subgroup 重定向
local subgroups = {
    ["rice-grain"] = "vegetable",
    wheat = "vegetable",
    wool = "animal_products",
    ["cleaned-wool"] = "animal_products",
    ["dried-wool"] = "animal_products",
    yarn = "animal_products",
}

local function add_item(name, subgroup)
    data:extend {
        {
            type = "item",
            name = name,
            icon = "__fruit__/graphics/icon/" .. name .. ".png",
            icon_size = 512,
            subgroup = subgroup or "fruit_product",
            order = name,
            stack_size = 100
        }
    }

    if not excludes[name] then
        table.insert(orders_recipe.restaurant, name)
    end

end

for k, name in pairs(items) do
    add_item(name, subgroups[name])
end


