local fruit = {
    apple = true,
    banana = true,
    orange = true,
    strawberry = true,
    watermelon = true,
    pear = true,
    kiwi = true,
    pineapple = true,
    grape = true,
    peach = true,
    mango = true,
    papaya = true,
    blueberry = true,
    plum = true,
    pomegranate = true,
    jackfruit = true,
    lychee = true,
    raspberry = true,
    blackberry = true,
    dragon_fruit = true,
    cantaloupe = true,
    passion_fruit = true,
    cherry = true,
    tangerine = true,
    guava = true,
    carambola = true,
    coconut = true,
    rambutan = true,
    durian = true,
    longan = true,
    fig = true,
    sapodilla = true,
    apricot = true,
    cranberry = true,
    persimmon = true,
    elderberry = true,
    currant = true,
    loquat = true,
    mulberry = true,
    lemon = true,
    grapefruit = true,
    prune = true,
    mangosteen = true,
    bayberry = true,
    olive = true,
    avocado = true,
    sugarcane = true,
}

for name, v in pairs(fruit) do
    local item = data.raw.item[name]
    if item then

    end
end

for name, v in pairs(fruit) do
    local fruit_item = data.raw.item[name]
    if fruit_item then
        -- 创建果汁物品
        data:extend {
            {
                type = "item",
                name = name .. "-juice", -- 果汁物品的名称，例如 "apple-juice"
                localised_name = { "", { "item-name." .. name }, { "item-name.juice" }, },
                icons = {
                    {
                        icon = "__fruit__/graphics/juice.png",
                        icon_size = 512,
                        scale = 0.08,
                    },
                    {
                        icon = fruit_item.icon,
                        icon_size = fruit_item.icon_size,
                        scale = 0.04,
                    },

                },
                subgroup = "fruit_juice",
                order = "a[fruit]-a[" .. name .. "]", -- 排序，方便在物品栏中查找
                stack_size = 50, -- 堆叠数量
                fuel_value = "50kJ",
                fuel_category = "fruit",
                default_request_amount = 100,
            },
            {
                type = "recipe",
                name = name .. "-juice", -- 配方的名称，与果汁物品名称一致
                enabled = true,
                energy_required = 10, -- 榨汁所需能量
                ingredients = { { type = "item", name = name, amount = 3 } },
                results = { { type = "item", name = name .. "-juice", amount = 1 } },
            }
        }
        -- 果酱部分
        data:extend {
            {
                type = "item",
                name = name .. "-jam", -- 果酱物品名称
                localised_name = { "", { "item-name." .. name }, { "item-name.jam" }, },
                icons = {

                    {
                        icon = "__fruit__/graphics/jam.png",
                        icon_size = 512,
                        scale = 0.08,
                        draw_background = true
                    },
                    {
                        icon = fruit_item.icon,
                        icon_size = fruit_item.icon_size,
                        scale = 0.04,
                    },
                },
                subgroup = "fruit_jam",
                order = "a[jam]-a[" .. name .. "]", -- 排序，方便在物品栏中查找
                stack_size = 50, -- 堆叠数量
                fuel_value = "50kJ",
                fuel_category = "fruit",
                default_request_amount = 100,
            },
            {
                type = "recipe",
                name = name .. "-jam", -- 果酱配方名称
                enabled = true,
                energy_required = 30, -- 榨汁所需能量
                category = "oil-processing",
                ingredients = {
                    { type = "item", name = name, amount = 4 },
                    { type = "item", name = "sugar", amount = 2 },
                    { type = "fluid", name = "water", amount = 10 },
                },
                results = { { type = "item", name = name .. "-jam", amount = 1 } },
                --crafting_machine = {"fruit-preserver"} -- 使用水果蜜饯机制作
            }
        }

        -- 水果派部分
        data:extend {
            {
                type = "item",
                name = name .. "-pie", -- 果酱物品名称
                localised_name = { "", { "item-name." .. name }, { "item-name.pie" }, },
                icons = {

                    {
                        icon = "__fruit__/graphics/pie.png",
                        icon_size = 512,
                        scale = 0.08,
                        draw_background = true
                    },
                    {
                        icon = fruit_item.icon,
                        icon_size = fruit_item.icon_size,
                        scale = 0.04,
                    },
                },
                subgroup = "fruit_pie",
                order = "a[jam]-a[" .. name .. "]", -- 排序，方便在物品栏中查找
                stack_size = 50, -- 堆叠数量
            },
            {
                type = "recipe",
                name = name .. "-pie", -- 果酱配方名称
                enabled = true,
                energy_required = 30, -- 榨汁所需能量
                --category = "oil-processing",
                ingredients = {
                    { type = "item", name = name, amount = 3 },
                    { type = "item", name = "pie-crust", amount = 1 },
                    { type = "item", name = "egg", amount = 1 },
                },
                results = { { type = "item", name = name .. "-pie", amount = 1 } },
                --crafting_machine = {"fruit-preserver"} -- 使用水果蜜饯机制作
            }
        }
    end
end
