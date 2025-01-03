require('__kry_stdlib__/stdlib/data/data').Util.create_data_globals()

has_dlc = feature_flags["spoiling"] and true or false

local DEBUG = false

--log("==========================flag==================================")
--print(serpent.block(feature_flags))

-- 定义一个函数来计算两个包含键值对的表的差集
local function difference(a, b)
    -- 创建一个空表来存储差集结果
    local diff = {}

    -- 遍历第一个表中的每个键值对
    for key, _ in pairs(a) do
        -- 检查该键是否不在第二个表中，或者在第二个表中但值不为 true
        if not (b[key]) then
            -- 如果键不在第二个表中，或者在第二个表中但值不为 true，则将其添加到差集结果中
            diff[key] = true
        end
    end

    -- 返回差集结果
    return diff
end
raw_item = {}

if DEBUG then

    for name, v in pairs(data.raw.item) do
        raw_item[name] = true
    end

end

orders_recipe = {}
orders_recipe.restaurant = {}

require("data.const")
require("data.group")
require("data.technology")
require("data.fruit")
require("data.vegetable")
require("data.animal_products")
require("data.products")
require("data.item")
require("data.plant")
require("data.recipe")
require("data.entity")
require("data.juice")
require("data.farm")
require("data.generator")
require("data.egg")
require("data.corehub")
require("data.card-upgrader")
require("data.commercial.restaurant")
require("data.processing.cocoa")
require("data.processing.rice")
require("data.processing.wheat")
require("data.processing.yarn")
require("data.processing.coffee")
require("data.processing.potato")

require("data.processing.drying")
require("data.recipe2")

if DEBUG then

    raw_item2 = {}

    for name, v in pairs(data.raw.item) do
        raw_item2[name] = true
    end

    local difference_item = difference(raw_item2, raw_item)

    for name, recipe in pairs(data.raw.recipe) do
        if recipe.category ~= "fruit_plant" and recipe.category ~= "farming" then
            if recipe.results then
                for k, result in pairs(recipe.results) do
                    difference_item[result.name] = nil
                end
            end
        end
    end

    -- 最终缺失的配方
    print("==========================最终缺失的配方==================================")

    for key, _ in pairs(difference_item) do
        if data.raw.item[key].subgroup ~= "fruit" and data.raw.item[key].subgroup ~= "vegetable" then

            print(key)  -- 输出: a
        end
    end
end

--honey --蜂蜜
--duck_egg --鸭蛋
--rabbit_pelt --兔皮
--turkey_meat --火鸡肉
--goose_feather --鹅毛
--ostrich_egg --鸵鸟蛋
--quail_egg --鹌鹑蛋
--duck_meat --鸭肉
--turkey_feather --火鸡毛
--coconut-milk --椰奶
--vanilla-milkshake --香草奶昔
--almond-milk --杏仁奶
--brandy --白兰地
--vodka --伏特加
--whiskey --威士忌
--beer --啤酒
--dark-rum --黑朗姆酒
--white-rum --白朗姆酒
--sake --清酒
--tequila --龙舌兰酒
--wine --葡萄酒
--white-wine --白葡萄酒
--maotai --茅台酒
--champagne --香槟安帕涅
--cream-puff --泡芙
--brownie --布朗尼
--caramel-pudding --焦糖布丁
--donut --甜甜圈
--tiramisu --提拉米苏
--kung-pao-chicken --宫保鸡丁
--tangyuan --汤圆
--dumpling --饺子
--fried-chicken --炸鸡
--braised-pork --红烧肉
--cucumber-salad --黄瓜沙拉
--mapo-tofu --麻婆豆腐
--carrot-juice --胡萝卜汁
--cola --可乐
--pudding --布丁
--chocolate-milkshake --巧克力奶昔
--soup --汤
--chili --辣椒
--wool --羊毛
--dried-wool --干羊毛
--dried-rice --干米
--cocoa-pod --可可豆荚
--dried-cocoa-bean --干可可豆
--dried-wheat --干小麦
--coffee-seed --咖啡籽
--dried-coffee-seed --干咖啡籽
