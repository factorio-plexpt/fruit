---- 蜂蜜
--RECIPE {
--    type = "recipe",
--    name = "honey",
--    enabled = false,
--    energy_required = 30,
--    ingredients = {
--        { type = "item", name = "flower", amount = 5 }, -- 假设mod中存在“花”这种资源，或者可以考虑用某种浆果代替
--    },
--    results = { { type = "item", amount = 1, name = "honey" } },
--    category = "agitator", -- 搅拌机可能适合蜂蜜的制作
--}:add_unlock("advanced-agriculture") -- 可以将蜂蜜解锁放在更高级的农业科技中

---- 鸭蛋
--RECIPE {
--    type = "recipe",
--    name = "duck_egg",
--    enabled = false,
--    energy_required = 5,
--    ingredients = {
--        { type = "item", name = "duck", amount = 1 }, -- 假设mod中存在“鸭”这种生物
--    },
--    results = { { type = "item", amount = 1, name = "duck_egg" } },
--    category = "food-command-center", -- 动物产品可能在美食枢纽中处理
--}:add_unlock("animal-husbandry") -- 解锁可能需要动物饲养相关的科技
--
---- 兔皮
--RECIPE {
--    type = "recipe",
--    name = "rabbit_pelt",
--    enabled = false,
--    energy_required = 10,
--    ingredients = {
--        { type = "item", name = "rabbit", amount = 1 }, -- 假设mod中存在“兔子”这种生物
--    },
--    results = { { type = "item", amount = 1, name = "rabbit_pelt" } },
--    category = "food-command-center",
--}:add_unlock("animal-husbandry")
--
---- 火鸡肉
--RECIPE {
--    type = "recipe",
--    name = "turkey_meat",
--    enabled = false,
--    energy_required = 15,
--    ingredients = {
--        { type = "item", name = "turkey", amount = 1 }, -- 假设mod中存在“火鸡”这种生物
--    },
--    results = { { type = "item", amount = 2, name = "turkey_meat" } }, -- 一只火鸡可以产出多块肉
--    category = "food-command-center",
--}:add_unlock("advanced-animal-husbandry")

-- 鹅毛
--RECIPE {
--    type = "recipe",
--    name = "goose_feather",
--    enabled = false,
--    energy_required = 8,
--    ingredients = {
--        { type = "item", name = "goose", amount = 1 }, -- 假设mod中存在“鹅”这种生物
--    },
--    results = { { type = "item", amount = 3, name = "goose_feather" } }, -- 一只鹅可以产出多根羽毛
--    category = "food-command-center",
--}:add_unlock("animal-husbandry")

-- 鸵鸟蛋
--RECIPE {
--    type = "recipe",
--    name = "ostrich_egg",
--    enabled = false,
--    energy_required = 10,
--    ingredients = {
--        { type = "item", name = "ostrich", amount = 1 }, -- 假设mod中存在“鸵鸟”这种生物
--    },
--    results = { { type = "item", amount = 1, name = "ostrich_egg" } },
--    category = "food-command-center",
--}:add_unlock("advanced-animal-husbandry")

-- 鹌鹑蛋
--RECIPE {
--    type = "recipe",
--    name = "quail_egg",
--    enabled = false,
--    energy_required = 5,
--    ingredients = {
--        { type = "item", name = "quail", amount = 1 }, -- 假设mod中存在“鹌鹑”这种生物
--    },
--    results = { { type = "item", amount = 4, name = "quail_egg" } }, -- 一只鹌鹑可以产出多个蛋
--    category = "food-command-center",
--}:add_unlock("animal-husbandry")

-- 鸭肉
--RECIPE {
--    type = "recipe",
--    name = "duck_meat",
--    enabled = false,
--    energy_required = 12,
--    ingredients = {
--        { type = "item", name = "duck", amount = 1 },
--    },
--    results = { { type = "item", amount = 2, name = "duck_meat" } },
--    category = "food-command-center",
--}:add_unlock("animal-husbandry")
--
---- 火鸡毛
--RECIPE {
--    type = "recipe",
--    name = "turkey_feather",
--    enabled = false,
--    energy_required = 6,
--    ingredients = {
--        { type = "item", name = "turkey", amount = 1 },
--    },
--    results = { { type = "item", amount = 5, name = "turkey_feather" } },
--    category = "food-command-center",
--}:add_unlock("advanced-animal-husbandry")

-- 椰奶
RECIPE {
    type = "recipe",
    name = "coconut-milk",
    enabled = false,
    energy_required = 15,
    ingredients = {
        { type = "item", name = "coconut", amount = 1 }, -- 假设mod中存在“椰子”这种水果
        { type = "fluid", name = "water", amount = 1 }, -- 需要水
    },
    results = { { type = "item", amount = 1, name = "coconut-milk" } },
    category = "agitator",
}:add_unlock("food-processing")

-- 香草奶昔
RECIPE {
    type = "recipe",
    name = "vanilla-milkshake",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "milk", amount = 2 }, -- 假设mod中有牛奶
        { type = "item", name = "sugar", amount = 1 },
        --{ type = "item", name = "ice", amount = 1 }, -- 假设mod中有香草
    },
    results = { { type = "item", amount = 1, name = "vanilla-milkshake" } },
    category = "agitator",
--}:add_unlock("beverages")
}:add_unlock("food-processing")

-- 杏仁奶
--RECIPE {
--    type = "recipe",
--    name = "almond-milk",
--    enabled = false,
--    energy_required = 25,
--    ingredients = {
--        { type = "item", name = "almond", amount = 3 }, -- 假设mod中有杏仁
--        { type = "fluid", name = "water", amount = 1 },
--    },
--    results = { { type = "item", amount = 1, name = "almond-milk" } },
--    category = "agitator",
--}:add_unlock("nut-processing")

-- 白兰地
RECIPE {
    type = "recipe",
    name = "brandy",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "wine", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "brandy" } },
    category = "oak", -- 蒸馏过程可能也放在发酵室
}:add_unlock("wine")

-- 伏特加
RECIPE {
    type = "recipe",
    name = "vodka",
    enabled = false,
    energy_required = 50,
    ingredients = {
        { type = "item", name = "potato", amount = 5 }, -- 假设mod中有土豆
    },
    results = { { type = "item", amount = 1, name = "vodka" } },
    category = "oak",
}:add_unlock("wine")

-- 威士忌
RECIPE {
    type = "recipe",
    name = "whiskey",
    enabled = false,
    energy_required = 70,
    ingredients = {
        { type = "item", name = "dried-wheat", amount = 5 },
    },
    results = { { type = "item", amount = 1, name = "whiskey" } },
    category = "oak",
}:add_unlock("wine")

-- 啤酒
RECIPE {
    type = "recipe",
    name = "beer",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "dried-wheat", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
        { type = "fluid", name = "water", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "beer" } },
    category = "oak",
}:add_unlock("wine")

-- 黑朗姆酒
RECIPE {
    type = "recipe",
    name = "dark-rum",
    enabled = false,
    energy_required = 65,
    ingredients = {
        { type = "item", name = "syrup", amount = 4 },
    },
    results = { { type = "item", amount = 1, name = "dark-rum" } },
    category = "oak",
}:add_unlock("wine")

-- 白朗姆酒
RECIPE {
    type = "recipe",
    name = "white-rum",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "syrup", amount = 3 },
    },
    results = { { type = "item", amount = 1, name = "white-rum" } },
    category = "oak",
}:add_unlock("wine")

-- 清酒
RECIPE {
    type = "recipe",
    name = "sake",
    enabled = false,
    energy_required = 55,
    ingredients = {
        { type = "item", name = "dried-rice", amount = 4 },
        { type = "fluid", name = "water", amount = 2 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "sake" } },
    category = "oak",
}:add_unlock("wine")

-- 龙舌兰酒
RECIPE {
    type = "recipe",
    name = "tequila",
    enabled = false,
    energy_required = 75,
    ingredients = {
        { type = "item", name = "agave", amount = 5 }, -- 假设mod中有龙舌兰
        { type = "fluid", name = "water", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "tequila" } },
    category = "oak",
}:add_unlock("wine")

-- 葡萄酒
RECIPE {
    type = "recipe",
    name = "wine",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "grape", amount = 5 }, -- 假设mod中有葡萄
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "wine" } },
    category = "oak",
}:add_unlock("wine")

-- 白葡萄酒
RECIPE {
    type = "recipe",
    name = "white-wine",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "grape", amount = 5 }, -- 假设mod中有白葡萄
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "white-wine" } },
    category = "oak",
}:add_unlock("wine")

-- 茅台酒
RECIPE {
    type = "recipe",
    name = "maotai",
    enabled = false,
    energy_required = 80,
    ingredients = {
        { type = "item", name = "dried-wheat", amount = 6 }, -- 假设mod中有高粱
        { type = "fluid", name = "water", amount = 3 },
        { type = "item", name = "yeast", amount = 2 },
    },
    results = { { type = "item", amount = 1, name = "maotai" } },
    category = "oak",
}:add_unlock("brewing")

-- 香槟
RECIPE {
    type = "recipe",
    name = "champagne",
    enabled = false,
    energy_required = 90,
    ingredients = {
        { type = "item", name = "white-wine", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "champagne" } },
    category = "oak", -- 二次发酵
}:add_unlock("wine")

-- 泡芙
RECIPE {
    type = "recipe",
    name = "cream-puff",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "flour", amount = 2 },
        { type = "item", name = "egg", amount = 1 }, -- 假设mod中有通用的“蛋”
        { type = "item", name = "butter", amount = 1 },
        { type = "item", name = "cream", amount = 1 },
    },
    results = { { type = "item", amount = 2, name = "cream-puff" } },
    category = "oven",
}:add_unlock("baking")

-- 布朗尼
RECIPE {
    type = "recipe",
    name = "brownie",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "flour", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "butter", amount = 1 },
        { type = "item", name = "cocoa-powder", amount = 2 }, -- 假设mod中有可可粉
    },
    results = { { type = "item", amount = 2, name = "brownie" } },
    category = "oven",
}:add_unlock("chocolate-processing")

-- 焦糖布丁
RECIPE {
    type = "recipe",
    name = "caramel-pudding",
    enabled = false,
    energy_required = 35,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "sugar", amount = 2 },
        { type = "item", name = "egg", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "caramel-pudding" } },
    category = "pot",
}:add_unlock("baking")

-- 甜甜圈
RECIPE {
    type = "recipe",
    name = "donut",
    enabled = false,
    energy_required = 35,
    ingredients = {
        { type = "item", name = "flour", amount = 3 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "egg", amount = 1 },
        { type = "item", name = "yeast", amount = 1 },
    },
    results = { { type = "item", amount = 2, name = "donut" } },
    category = "oven",
}:add_unlock("baking")

-- 提拉米苏
RECIPE {
    type = "recipe",
    name = "tiramisu",
    enabled = false,
    energy_required = 50,
    ingredients = {
        { type = "item", name = "cookie", amount = 3 },
        { type = "item", name = "cream", amount = 2 },
        { type = "item", name = "coffee", amount = 1 }, -- 假设mod中有咖啡
        { type = "item", name = "cocoa-powder", amount = 1 },
        { type = "item", name = "brandy", amount = 1 }, -- 可选
    },
    results = { { type = "item", amount = 1, name = "tiramisu" } },
    category = "agitator", -- 需要混合
}:add_unlock("baking")

-- 宫保鸡丁
RECIPE {
    type = "recipe",
    name = "kung-pao-chicken",
    enabled = false,
    energy_required = 60,
    ingredients = {
        { type = "item", name = "chicken_meat", amount = 2 }, -- 假设mod中有鸡肉
        --{ type = "item", name = "peanut", amount = 3 }, -- 假设mod中有花生
        { type = "item", name = "chili", amount = 2 },
        { type = "item", name = "soy_sauce", amount = 1 },
        { type = "item", name = "vinegar", amount = 1 },
        { type = "item", name = "sugar", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "kung-pao-chicken" } },
    category = "pot",
}:add_unlock("cooking")

-- 汤圆
RECIPE {
    type = "recipe",
    name = "tangyuan",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "rice-flour", amount = 3 }, -- 假设mod中有糯米粉
        { type = "fluid", name = "water", amount = 1 },
        { type = "item", name = "brown_sugar", amount = 1 }, -- 假设mod中有芝麻馅
        --{ type = "item", name = "sesame_paste", amount = 1 }, -- 假设mod中有芝麻馅
    },
    results = { { type = "item", amount = 5, name = "tangyuan" } },
    category = "pot",
}:add_unlock("cooking")

-- 饺子
RECIPE {
    type = "recipe",
    name = "dumpling",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "item", name = "dough", amount = 2 },
        { type = "item", name = "pork", amount = 1 }, -- 假设mod中有猪肉
        { type = "item", name = "cabbage", amount = 1 }, -- 假设mod中有白菜
        { type = "item", name = "ginger", amount = 1 }, -- 假设mod中有姜
    },
    results = { { type = "item", amount = 4, name = "dumpling" } },
    category = "pot",
}:add_unlock("cooking")

-- 炸鸡
RECIPE {
    type = "recipe",
    name = "fried-chicken",
    enabled = false,
    energy_required = 55,
    ingredients = {
        { type = "item", name = "chicken_meat", amount = 2 },
        { type = "item", name = "flour", amount = 2 },
        { type = "item", name = "egg", amount = 1 },
        { type = "item", name = "olive_oil", amount = 1 },
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 2, name = "fried-chicken" } },
    category = "bbq", -- 烧烤架可以用来炸
}:add_unlock("cooking")

-- 红烧肉
RECIPE {
    type = "recipe",
    name = "braised-pork",
    enabled = false,
    energy_required = 70,
    ingredients = {
        { type = "item", name = "pork", amount = 3 },
        { type = "item", name = "soy_sauce", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "ginger", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "braised-pork" } },
    category = "pot",
}:add_unlock("advanced-cooking")

-- 黄瓜沙拉
RECIPE {
    type = "recipe",
    name = "cucumber-salad",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "cucumber", amount = 3 }, -- 假设mod中有黄瓜
        { type = "item", name = "vinegar", amount = 1 },
        { type = "item", name = "salt", amount = 1 },
        { type = "item", name = "olive_oil", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "cucumber-salad" } },
    category = "agitator", -- 可以理解为混合
}:add_unlock("basic-food-processing")

-- 麻婆豆腐
RECIPE {
    type = "recipe",
    name = "mapo-tofu",
    enabled = false,
    energy_required = 50,
    ingredients = {
        { type = "item", name = "tofu", amount = 2 }, -- 假设mod中有豆腐
        { type = "item", name = "chicken_meat", amount = 1 }, -- 假设mod中有肉末
        { type = "item", name = "soy_sauce", amount = 1 },
        { type = "item", name = "chili", amount = 1 },
        --{ type = "item", name = "fermented_black_beans", amount = 1 }, -- 假设mod中有豆豉
    },
    results = { { type = "item", amount = 1, name = "mapo-tofu" } },
    category = "pot",
}:add_unlock("cooking")

-- 胡萝卜汁
RECIPE {
    type = "recipe",
    name = "carrot-juice",
    enabled = false,
    energy_required = 20,
    ingredients = {
        { type = "item", name = "carrot", amount = 4 }, -- 假设mod中有胡萝卜
    },
    results = { { type = "item", amount = 1, name = "carrot-juice" } },
    category = "juice",
}:add_unlock("fruit-juicing")

-- 可乐
RECIPE {
    type = "recipe",
    name = "cola",
    enabled = false,
    energy_required = 45,
    ingredients = {
        { type = "item", name = "syrup", amount = 2 },
        { type = "fluid", name = "water", amount = 2 }, -- 假设mod中有碳酸水
        --{ type = "item", name = "cola-flavoring", amount = 1 }, -- 假设mod中有可乐香料
    },
    results = { { type = "item", amount = 1, name = "cola" } },
    category = "agitator",
}:add_unlock("beverages")

-- 布丁
RECIPE {
    type = "recipe",
    name = "pudding",
    enabled = false,
    energy_required = 30,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "egg", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "pudding" } },
    category = "pot",
}:add_unlock("desserts")

-- 巧克力奶昔
RECIPE {
    type = "recipe",
    name = "chocolate-milkshake",
    enabled = false,
    energy_required = 25,
    ingredients = {
        { type = "item", name = "milk", amount = 2 },
        { type = "item", name = "sugar", amount = 1 },
        { type = "item", name = "cocoa-powder", amount = 1 }, -- 假设mod中有可可粉
    },
    results = { { type = "item", amount = 1, name = "chocolate-milkshake" } },
    category = "agitator",
}:add_unlock("beverages")

-- 汤
RECIPE {
    type = "recipe",
    name = "soup",
    enabled = false,
    energy_required = 40,
    ingredients = {
        { type = "fluid", name = "water", amount = 3 },
        --{ type = "item", name = "vegetable", amount = 2 }, -- 假设mod中有通用蔬菜
        --{ type = "item", name = "meat", amount = 1 }, -- 假设mod中有通用肉类
        { type = "item", name = "salt", amount = 1 },
    },
    results = { { type = "item", amount = 1, name = "soup" } },
    category = "pot",
}:add_unlock("cooking")

-- 辣椒
-- 辣椒可以直接作为作物收获，不需要额外配方

-- 羊毛
-- 羊毛可以直接从羊身上获得，不需要额外配方

-- 干羊毛

-- 咖啡籽
-- 咖啡籽可以直接作为作物收获，不需要额外配方


