for _, lab in pairs(data.raw["lab"]) do
    if lab.inputs then
        local packname = "restaurant-science-pack"
        table.insert(lab.inputs, packname)
    end
end

------------------------------------
local animals_loot = {
    cow = {
        {
            item = "beef", -- 生牛肉
            count_min = 1,
            count_max = 30,
        },
        {
            item = "leather", -- 皮革
            count_min = 1,
            count_max = 20,
        },
        {
            item = "milk", -- 牛奶桶（假设有这个物品）
            count_min = 1,
            count_max = 10,
        },
        {
            item = "cow-egg", --
            count_min = 2,
            count_max = 8,
        }
    },
    chicken = {
        {
            item = "chicken_meat", -- 生鸡肉
            count_min = 1,
            count_max = 20,
        },
        {
            item = "egg", -- 鸡蛋
            count_min = 1,
            count_max = 30,
        },
        {
            item = "feather", -- 羽毛
            count_min = 2,
            count_max = 50,
        }
    },
    sheep = {
        {
            item = "lamb_meat", -- 生羊肉
            count_min = 1,
            count_max = 20,
        },
        {
            item = "wool", -- 羊毛
            count_min = 3,
            count_max = 60,
        },
        {
            item = "leather", -- 皮革
            count_min = 1,
            count_max = 10,
        },
        {
            item = "sheep-egg", --
            count_min = 2,
            count_max = 8,
        }
    },
    psyduck = {
        {
            item = "duck_meat", -- 生肉
            count_min = 1,
            count_max = 20,
        },
        {
            item = "duck_egg",
            count_min = 3,
            count_max = 60,
        },
        {
            item = "feather",
            count_min = 5,
            count_max = 60,
        }
    }
}

for name, loot in pairs(animals_loot) do
    local animal = data.raw["unit"][name]
    if animal then
        animal.loot = loot
        animal.corpse = nil
    end
end
