local fruit = {
    apple = { r = 1, g = 0, b = 0, a = 0.6 }, -- Red
    banana = { r = 1, g = 1, b = 0, a = 0.6 }, -- Yellow
    orange = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Orange
    strawberry = { r = 1, g = 0, b = 0.2, a = 0.6 }, -- Deep Red/Pink
    watermelon = { r = 0, g = 0.5, b = 0, a = 0.6 }, -- Green (rind) / {r=1, g=0, b=0, a=0.6} (flesh) - I'll use rind for simplicity here
    pear = { r = 0.8, g = 1, b = 0, a = 0.6 }, -- Yellow-Green
    kiwi = { r = 0.3, g = 0.6, b = 0.2, a = 0.6 }, -- Green-Brown
    pineapple = { r = 1, g = 0.8, b = 0, a = 0.6 }, -- Yellow-Orange
    grape = { r = 0.5, g = 0, b = 0.5, a = 0.6 }, -- Purple/Green (depending on variety, using purple here)
    peach = { r = 1, g = 0.7, b = 0.3, a = 0.6 }, -- Pink-Orange
    mango = { r = 1, g = 0.6, b = 0, a = 0.6 }, -- Yellow-Orange
    papaya = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Orange
    blueberry = { r = 0, g = 0, b = 1, a = 0.6 }, -- Blue
    plum = { r = 0.5, g = 0, b = 0.5, a = 0.6 }, -- Purple
    pomegranate = { r = 0.6, g = 0, b = 0, a = 0.6 }, -- Deep Red
    jackfruit = { r = 0.8, g = 0.6, b = 0.2, a = 0.6 }, -- Yellow-Greenish Brown
    lychee = { r = 1, g = 0.8, b = 0.8, a = 0.6 }, -- Pinkish White
    raspberry = { r = 1, g = 0.2, b = 0.2, a = 0.6 }, -- Red-Pink
    blackberry = { r = 0.1, g = 0.1, b = 0.1, a = 0.6 }, -- Very Dark Purple/Black
    dragon_fruit = { r = 1, g = 0.8, b = 0.8, a = 0.6 }, -- Pink (flesh) / {r=0.8, g=0, b=0.2, a=0.6} (skin) - Using flesh here
    cantaloupe = { r = 1, g = 0.7, b = 0.4, a = 0.6 }, -- Light Orange
    passion_fruit = { r = 0.6, g = 0.2, b = 0, a = 0.6 }, -- Dark Purple/Brownish
    cherry = { r = 0.8, g = 0, b = 0, a = 0.6 }, -- Red
    --tangerine = { r = 1, g = 0.6, b = 0, a = 0.6 }, -- Orange
    guava = { r = 0.7, g = 0.9, b = 0.5, a = 0.6 }, -- Light Green
    carambola = { r = 1, g = 0.9, b = 0.2, a = 0.6 }, -- Yellow
    coconut = { r = 0.8, g = 0.7, b = 0.5, a = 0.6 }, -- Brown/White (using brownish here)
    rambutan = { r = 1, g = 0.2, b = 0.2, a = 0.6 }, -- Red
    tomato = { r = 1, g = 0.2, b = 0.2, a = 0.6 }, -- Red
    durian = { r = 0.9, g = 0.8, b = 0.2, a = 0.6 }, -- Yellow-Green
    longan = { r = 0.7, g = 0.5, b = 0.3, a = 0.6 }, -- Brown
    fig = { r = 0.5, g = 0.1, b = 0.3, a = 0.6 }, -- Purple/Brownish
    sapodilla = { r = 0.6, g = 0.4, b = 0.2, a = 0.6 }, -- Brown
    apricot = { r = 1, g = 0.7, b = 0.3, a = 0.6 }, -- Orange-Yellow
    cranberry = { r = 0.7, g = 0, b = 0.1, a = 0.6 }, -- Deep Red
    persimmon = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Orange
    elderberry = { r = 0.2, g = 0, b = 0.4, a = 0.6 }, -- Dark Purple
    --currant = { r = 0.6, g = 0, b = 0, a = 0.6 }, -- Red
    loquat = { r = 1, g = 0.8, b = 0.4, a = 0.6 }, -- Orange-Yellow
    mulberry = { r = 0.3, g = 0, b = 0.3, a = 0.6 }, -- Dark Purple
    lemon = { r = 1, g = 1, b = 0, a = 0.6 }, -- Yellow
    grapefruit = { r = 1, g = 0.5, b = 0, a = 0.6 }, -- Pink-Orange
    prune = { r = 0.2, g = 0, b = 0.2, a = 0.6 }, -- Dark Purple
    mangosteen = { r = 0.5, g = 0, b = 0.5, a = 0.6 }, -- Dark Purple (rind) / White (flesh) - Using rind here
    bayberry = { r = 0.4, g = 0, b = 0.1, a = 0.6 }, -- Dark Red/Purple
    olive = { r = 0.4, g = 0.4, b = 0, a = 0.6 }, -- Green/Black (using greenish here)
    avocado = { r = 0.3, g = 0.5, b = 0.1, a = 0.6 }, -- Green
    sugarcane = { r = 0.8, g = 0.7, b = 0.4, a = 0.6 }, -- Light Brown
}

for name, color in pairs(fruit) do
    local fruit_item = data.raw.item[name]
    if fruit_item then
        -- 创建果汁物品
        ITEM {
            type = "item",
            name = name .. "-juice", -- 果汁物品的名称，例如 "apple-juice"
            localised_name = { "", { "item-name." .. name }, { "item-name.juice" }, },
            icons = {
                {
                    icon = "__fruit__/graphics/juice.png",
                    icon_size = 512,
                    scale = 0.08,
                    tint = color,
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
            fuel_value = "3MJ",
            burnt_result = "ash",
            fuel_category = "fruit",
            default_request_amount = 100,
        }

        RECIPE {
            type = "recipe",
            name = name .. "-juice", -- 配方的名称，与果汁物品名称一致
            crafting_machine_tint = { primary = color },
            enabled = false,
            energy_required = 10, -- 榨汁所需能量
            ingredients = { { type = "item", name = name, amount = 3 } },
            results = { { type = "item", name = name .. "-juice", amount = 1 } },
            category = "juice",
        }:add_unlock("fruit-juicing")

        -- 果酱部分
        ITEM {
            type = "item",
            name = name .. "-jam", -- 果酱物品名称
            localised_name = { "", { "item-name." .. name }, { "item-name.jam" }, },
            icons = {

                {
                    icon = "__fruit__/graphics/jam.png",
                    tint = color,
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
            fuel_value = "3MJ",
            burnt_result = "ash",
            fuel_category = "fruit",
            default_request_amount = 100,
        }
        RECIPE {
            type = "recipe",
            name = name .. "-jam", -- 果酱配方名称
            enabled = false,
            energy_required = 30, -- 榨汁所需能量
            category = "jam",
            crafting_machine_tint = { primary = color },
            ingredients = {
                { type = "item", name = name, amount = 4 },
                { type = "item", name = "sugar", amount = 2 },
                { type = "fluid", name = "water", amount = 10 },
            },
            results = { { type = "item", name = name .. "-jam", amount = 1 } },
            category = "jam",
        }:add_unlock("jam-making")


        -- 水果派部分
        ITEM {
            type = "item",
            name = name .. "-pie", -- 果酱物品名称
            localised_name = { "", { "item-name." .. name }, { "item-name.pie" }, },
            icons = {

                {
                    icon = "__fruit__/graphics/pie.png",
                    icon_size = 512,
                    scale = 0.08,
                    tint = color,

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
        }
        RECIPE {
            type = "recipe",
            name = name .. "-pie", -- 果酱配方名称
            enabled = false,
            energy_required = 30, -- 榨汁所需能量
            category = "pie",
            crafting_machine_tint = { primary = color },
            ingredients = {
                { type = "item", name = name, amount = 3 },
                { type = "item", name = "pie-crust", amount = 1 },
                { type = "item", name = "egg", amount = 1 },
            },
            results = { { type = "item", name = name .. "-pie", amount = 1 } },
            --crafting_machine = {"fruit-preserver"} -- 使用水果蜜饯机制作
        }:add_unlock("pie-baking")

        -- ice部分
        ITEM {
            type = "item",
            name = name .. "-icecream", -- 果酱物品名称
            localised_name = { "", { "item-name." .. name }, { "item-name.icecream" }, },
            icons = {

                {
                    icon = "__fruit__/graphics/icon/icecream.png",
                    icon_size = 512,
                    scale = 0.08,
                    draw_background = true
                },
                {
                    icon = "__fruit__/graphics/icon/icecream-top.png",
                    icon_size = 512,
                    scale = 0.08,
                    tint = color,
                    draw_background = true
                },
            },
            subgroup = "fruit_icecream",
            order = "a[jam]-a[" .. name .. "]", -- 排序，方便在物品栏中查找
            stack_size = 50, -- 堆叠数量
        }

        RECIPE {
            type = "recipe",
            name = name .. "-icecream", -- 果酱配方名称
            enabled = false,
            energy_required = 2, -- 榨汁所需能量
            category = "icecream",
            crafting_machine_tint = { primary = color },
            ingredients = {
                { type = "item", name = name .. "-juice", amount = 1 },
                { type = "item", name = name .. "-jam", amount = 1 },
                { type = "item", name = "icecream", amount = 1 },
            },
            results = { { type = "item", name = name .. "-icecream", amount = 1 } },
            --crafting_machine = {"fruit-preserver"} -- 使用水果蜜饯机制作
            category = "icecream",
        }:add_unlock("ice-cream-making")

        table.insert(orders_recipe.restaurant, name .. "-juice")
        table.insert(orders_recipe.restaurant, name .. "-jam")
        table.insert(orders_recipe.restaurant, name .. "-pie")
        table.insert(orders_recipe.restaurant, name .. "-icecream")

    end
end
