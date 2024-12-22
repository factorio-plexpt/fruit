local entity_util = require("lib.entity_util")

local name = "food-command-center"

data:extend {
    {
        type = "container",
        name = name,
        icon = "__fruit__/graphics/entity/food-command-center.png",
        icon_size = 1024,
        max_health = 1000,
        inventory_size = 1,
        inventory_type = "normal",
        quality_affects_inventory_size = false,
        circuit_wire_max_distance = 100,
        rotatable = false,
        flags = { "placeable-neutral", "player-creation", "not-rotatable", "get-by-unit-number" },
        corpse = "big-remnants",
        minable = { mining_time = 1, result = name },
        vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
        open_sound = { filename = "__base__/sound/open-close/beacon-open.ogg", volume = 0.4 },
        close_sound = { filename = "__base__/sound/open-close/beacon-close.ogg", volume = 0.4 },
        collision_box = entity_util.shrinkBox(entity_util.box11),
        selection_box = entity_util.box11,
        picture = {
            layers = {
                {
                    filename = "__fruit__/graphics/entity/food-command-center.png",
                    priority = "high",
                    size = 1024,
                    scale = 0.5,
                    shift = { 0, -1.5 }
                },
            }
        },
    }
}

TECHNOLOGY {
    type = "technology",
    name = name,
    icon = "__fruit__/graphics/entity/food-command-center.png",
    icon_size = 1024,
    effects = {    },
    prerequisites = { "food-processing" },
    unit = {
        count = 2000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 }
        },
        time = 5
    },
}

TECHNOLOGY {
    type = "technology",
    name = "food-core-card",
    icon = "__fruit__/graphics/icon/core-card-tech.png",
    icon_size = 512,
    effects = { },
    prerequisites = { name },
    research_trigger = {
        type = "build-entity",
        entity = name
    }
}

RECIPE {
    type = "recipe",
    name = name,
    enabled = false,
    ingredients = {
        { type = "item", name = "electronic-circuit", amount = 10 },
        { type = "item", name = "iron-gear-wheel", amount = 20 },
        { type = "item", name = "iron-plate", amount = 20 },
        { type = "item", name = "copper-plate", amount = 10 }
    },
    results = {
        { type = "item", name = name, amount = 1 },
    },
    energy_required = 4,
    category = "crafting"
}:add_unlock(name)

-- 创建新物品
ITEM {
    type = "item",
    name = name,
    icon = "__fruit__/graphics/entity/food-command-center.png",
    icon_size = 1024,
    flags = { "not-stackable" },
    subgroup = "fruit_machine",
    order = "aaaa",
    stack_size = 1,
    place_result = name,
}

local colors = {
    ---- 普通: 灰色 (1-6)
    --{ r = 0.4, g = 0.4, b = 0.4, a = 1 }, -- 1
    --{ r = 0.45, g = 0.45, b = 0.45, a = 1 }, -- 2
    --{ r = 0.5, g = 0.5, b = 0.5, a = 1 }, -- 3
    --{ r = 0.55, g = 0.55, b = 0.55, a = 1 }, -- 4
    --{ r = 0.6, g = 0.6, b = 0.6, a = 1 }, -- 5
    --{ r = 0.65, g = 0.65, b = 0.65, a = 1 }, -- 6

    -- 精良: 绿色 (7-12)
    { r = 0.3, g = 0.6, b = 0.3, a = 1 }, -- 7
    { r = 0.25, g = 0.65, b = 0.25, a = 1 }, -- 8
    { r = 0.2, g = 0.7, b = 0.2, a = 1 }, -- 9
    { r = 0.15, g = 0.75, b = 0.15, a = 1 }, -- 10
    { r = 0.1, g = 0.8, b = 0.1, a = 1 }, -- 11
    { r = 0.05, g = 0.85, b = 0.05, a = 1 }, -- 12

    -- 稀有: 蓝色 (13-18)
    { r = 0.2, g = 0.4, b = 0.8, a = 1 }, -- 13
    { r = 0.15, g = 0.45, b = 0.85, a = 1 }, -- 14
    { r = 0.1, g = 0.5, b = 0.9, a = 1 }, -- 15
    { r = 0.05, g = 0.55, b = 0.95, a = 1 }, -- 16
    { r = 0.0, g = 0.6, b = 1.0, a = 1 }, -- 17
    { r = 0.0, g = 0.65, b = 1.0, a = 1 }, -- 18

    -- 普通: 红色 (1-6)
    { r = 0.4, g = 0.1, b = 0.1, a = 1 }, -- 1
    { r = 0.5, g = 0.1, b = 0.1, a = 1 }, -- 2
    { r = 0.6, g = 0.1, b = 0.1, a = 1 }, -- 3
    { r = 0.7, g = 0.1, b = 0.1, a = 1 }, -- 4
    { r = 0.8, g = 0.1, b = 0.1, a = 1 }, -- 5
    { r = 0.9, g = 0.1, b = 0.1, a = 1 }, -- 6

    -- 史诗: 紫色 (19-24)
    { r = 0.6, g = 0.2, b = 0.6, a = 1 }, -- 19
    { r = 0.65, g = 0.15, b = 0.65, a = 1 }, -- 20
    { r = 0.7, g = 0.1, b = 0.7, a = 1 }, -- 21
    { r = 0.75, g = 0.05, b = 0.75, a = 1 }, -- 22
    { r = 0.8, g = 0.0, b = 0.8, a = 1 }, -- 23
    { r = 0.85, g = 0.0, b = 0.85, a = 1 }, -- 24

    -- 传说: 金色 (25-30)
    { r = 0.8, g = 0.6, b = 0.2, a = 1 }, -- 25
    { r = 0.85, g = 0.65, b = 0.25, a = 1 }, -- 26
    { r = 0.9, g = 0.7, b = 0.3, a = 1 }, -- 27
    { r = 0.95, g = 0.75, b = 0.35, a = 1 }, -- 28
    { r = 1.0, g = 0.8, b = 0.4, a = 1 }, -- 29
    { r = 1.0, g = 0.85, b = 0.45, a = 1 }, -- 30
}

-- 概率根据输入递减输出，输入 1 输出 1，输入 30 输出 0.1
local function calculate_probability(level)
    if level < 1 then
        return 1
    end

    if level > 30 then
        return 0.1
    end

    -- 使用线性插值计算输出
    local output = 1 - (level - 1) * (1 - 0.1) / (30 - 1)

    local multiplier = 1000 -- 保留3位
    return math.ceil(output * multiplier) / multiplier
end

local function add_card(level, color)

    local card_name = "food-core-card-" .. level
    data:extend {
        {
            type = "item",
            name = card_name,
            localised_name = { "", { "item-name.food-core-card" }, " MK" .. level },
            localised_description = { "item-description.food-core-card" },
            icons = {
                {
                    icon = "__fruit__/graphics/icon/core-card.png",
                    icon_size = 512,
                },
                {
                    icon = "__fruit__/graphics/icon/core-card.png",
                    icon_size = 512,
                    tint = color,
                },
            },
            subgroup = "food-core-card",
            order = "card" .. (level / 100),
            stack_size = 1
        }
    }

    local ingredients = {
        { type = "item", name = "electronic-circuit", amount = 31 },
        { type = "item", name = "advanced-circuit", amount = 19 },
        { type = "item", name = "processing-unit", amount = 7 },
    }

    if level > 1 then
        ingredients = {
            { type = "item", name = "food-core-card-" .. level - 1, amount = 1 }
        }
    end

    RECIPE {
        type = "recipe",
        name = card_name,
        localised_name = { "", { "item-name.food-core-card" }, { "fruit.card-upgrade" }, level .. "" },
        localised_description = { "item-description.food-core-card" },
        enabled = level > 1,
        hidden = level > 1,
        allow_productivity = false,
        auto_recycle = false,
        allow_decomposition = false,
        ingredients = ingredients,
        results = {
            { type = "item", name = card_name, amount = 1, probability = calculate_probability(level) },
        },
        energy_required = 4,
        category = level > 1 and "food-core-card" or "crafting"
    }:add_unlock("food-core-card")

end
for i, color in ipairs(colors) do
    add_card(i, color)

end

