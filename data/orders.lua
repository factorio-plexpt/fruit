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
            hidden = true,
            enabled = true,
            -- 是否启用此配方解锁其物品产品以显示在选择列表（物品过滤器、物流请求等）中。
            unlock_results = false,
            allow_productivity = false,
            auto_recycle = false,
            allow_decomposition = false,
            ingredients = ingredients,
            results = results,
        }
    })

end

--for i = 1, 1000 do
--    local ingredients = { { type = "item", name = "cheese", amount = 10 * i, ignored_by_stats = 1 } }
--    local results = { { type = "item", name = "cheese", amount = 1, probability = 0.5, ignored_by_stats = 1 } }
--    add_order_recipe(ingredients, results, "fruit_order_restaurant", i)
--end

local name = "food-pack"

local trigger = {
    items_per_trigger = 1,
    trigger = {
        type = "direct",
        action_delivery = {
            type = "instant",
            source_effects = {
                {
                    type = "script",
                    effect_id = "order_finish",
                }
            }
        }
    }
}

data:extend {
    {
        type = "item",
        name = name,
        icon = "__fruit__/graphics/icon/order64.png",
        icon_size = 64,
        subgroup = "fruit_pack_rubbish",
        stack_size = 1,
        hidden = true,
        hidden_in_factoriopedia = true,
        spoil_ticks = 0.5 * hour,
        spoil_to_trigger_result = trigger
    }
}
