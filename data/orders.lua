--订单 随机
--不可见 并且
-- 原料数 1-5 大量 1 少量 5
local function add_order_recipe(ingredients, results, category, index)

    --item.name ..
    data:extend({
        {
            type = "recipe",
            name = "fruit-order-" .. index,
            localised_name = { "recipe-name.fruit-order" },
            icon = "__fruit__/graphics/icon/order64.png",
            icon_size = 64,
            subgroup = "fruit_order",
            category = category,
            energy_required = 3,
            overload_multiplier = 1,
            hidden = true,
            enabled = true,
            -- 是否启用此配方解锁其物品产品以显示在选择列表（物品过滤器、物流请求等）中。
            unlock_results = false,
            allow_productivity = false,
            auto_recycle = false,
            allow_decomposition = false,
            --preserve_products_in_machine_output = true,
            allow_inserter_overload  = false,
            result_is_always_fresh = true,
            ingredients = ingredients,
            results = results,
        }
    })

end

local packname = "restaurant-science-pack"
local packnamerubbish = packname .. "-rubbish" -- "restaurant-science-pack-rubbish"

local trigger = {
    items_per_trigger = 1,
    trigger = {
        type = "direct",
        action_delivery = {
            type = "instant",
            source_effects = {
                {
                    type = "script",
                    effect_id = "order_finish_restaurant",
                },
                {
                    type = "insert-item",
                    item = packname,
                }
            }
        }
    }
}

data:extend {
    {
        type = "item",
        name = packnamerubbish,
        icon = "__fruit__/graphics/icon/" .. packname .. ".png",
        icon_size = 512,
        localised_name = { "item-name." .. packname },
        subgroup = "fruit_pack_rubbish",
        stack_size = 1,
        hidden = true,
        hidden_in_factoriopedia = true,
        spoil_ticks = 250,
        spoil_to_trigger_result = trigger,
        spoil_result = mods["space-age"] and "spoilage" or nil,
    },
    {
        type = "tool",
        name = packname,
        localised_description = { "item-description.science-pack" },
        icon = "__fruit__/graphics/icon/" .. packname .. ".png",
        icon_size = 512,
        subgroup = "science-pack",
        order = "f1",
        stack_size = 200,
        weight = 1 * kg,
        durability = 1,
        spoil_ticks = 1 * hour,
        spoil_result = mods["space-age"] and "spoilage" or nil,
        --color_hint = { text = "G" },
        --default_import_location = "gleba",
        --durability_description_key = "description.science-pack-remaining-amount-key",
        --factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        --durability_description_value = "description.science-pack-remaining-amount-value",
        --spoil_result = "spoilage",
        --random_tint_color = item_tints.bluish_science
    }
}

-------
local PRODUCTS = orders_recipe.restaurant

local NUM_PRODUCTS = #PRODUCTS
local NUM_ORDERS = 1000

-- 生成一个随机订单
local function generate_random_order()
    local num_items = math.random(1, 5)
    local order = {}
    local selected_products = {}

    for i = 1, num_items do
        local product_index
        repeat
            product_index = math.random(1, NUM_PRODUCTS)
        until not selected_products[product_index]

        selected_products[product_index] = true
        local product_id = PRODUCTS[product_index] -- 获取产品 ID
        order[product_id] = math.random(1, 10)
    end
    return order
end

local function generate_orders(num_orders)
    local orders = {}
    local product_counts = {}

    for i = 1, num_orders do
        local order = generate_random_order()
        table.insert(orders, order)

        for product_id, quantity in pairs(order) do
            product_counts[product_id] = (product_counts[product_id] or 0) + 1
        end
    end

    local total_products_selected = 0
    for _, count in pairs(product_counts) do
        total_products_selected = total_products_selected + count
    end
    local average_product_count = total_products_selected / NUM_PRODUCTS
    print("平均每个产品被选中的次数：", average_product_count)
    return orders
end

local orders = generate_orders(NUM_ORDERS)

local index = 1
for k, od in pairs(orders) do
    local ingredients = {}
    for name, amount in pairs(od) do
        table.insert(ingredients, { type = "item", name = name, amount = amount, ignored_by_stats = 1 })
    end
    local results = { { type = "item", name = packname, amount = 5 } }
    add_order_recipe(ingredients, results, "fruit_order_restaurant", index)
    index = index + 1
end


--for i = 1, math.min(10, #orders) do
--    local order_string = ""
--    for product_id, quantity in pairs(orders[i]) do
--        order_string = order_string .. "产品 " .. product_id .. ": " .. quantity .. ", "
--    end
--    print("订单 " .. i .. ": " .. order_string)
--end
--
---- 统计部分保持不变
--local product_counts = {}
--for _, order in ipairs(orders) do
--    for product_id, _ in pairs(order) do
--        product_counts[product_id] = (product_counts[product_id] or 0) + 1
--    end
--end
--local min_count = NUM_ORDERS
--local max_count = 0
--local min_products = {}
--local max_products = {}
--
--for product_id, count in pairs(product_counts) do
--    if count < min_count then
--        min_count = count
--        min_products = {product_id}
--    elseif count == min_count then
--        table.insert(min_products, product_id)
--    end
--
--    if count > max_count then
--        max_count = count
--        max_products = {product_id}
--    elseif count == max_count then
--        table.insert(max_products, product_id)
--    end
--end
--
--print("出现次数最少的产品（" .. min_count .. "次）：", table.concat(min_products, ", "))
--print("出现次数最多的产品（" .. max_count .. "次）：", table.concat(max_products, ", "))
