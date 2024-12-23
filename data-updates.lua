for _, lab in pairs(data.raw["lab"]) do
    if lab.inputs then
        local packname = "restaurant-science-pack"
        table.insert(lab.inputs, packname)
    end
end

local animals_loot = {
    cow = {
        {
            item = "beef", -- 生牛肉
            count_min = 1,
            count_max = 30,
            probability = 0.8 -- 80% 概率
        },
        {
            item = "leather", -- 皮革
            count_min = 1,
            count_max = 20,
            probability = 0.6 -- 60% 概率
        },
        {
            item = "milk", -- 牛奶桶（假设有这个物品）
            count_min = 1,
            count_max = 10,
            probability = 0.3 -- 30% 概率
        }
    },
    chicken = {
        {
            item = "chicken_meat", -- 生鸡肉
            count_min = 1,
            count_max = 20,
            probability = 0.7 -- 70% 概率
        },
        {
            item = "egg", -- 鸡蛋
            count_min = 1,
            count_max = 30,
            probability = 0.5 -- 50% 概率
        },
        {
            item = "feather", -- 羽毛
            count_min = 2,
            count_max = 50,
            probability = 0.9 -- 90% 概率
        }
    },
    sheep = {
        {
            item = "lamb_meat", -- 生羊肉
            count_min = 1,
            count_max = 20,
            probability = 0.75 -- 75% 概率
        },
        {
            item = "wool", -- 羊毛
            count_min = 3,
            count_max = 60,
            probability = 0.85 -- 85% 概率
        },
        {
            item = "leather", -- 皮革
            count_min = 1,
            count_max = 10,
            probability = 0.4 -- 40% 概率
        }
    }
}

for name, loot in pairs(animals_loot) do
    local animal = data.raw["unit"][name]
    if animal then
        animal.loot = loot
    end
end
