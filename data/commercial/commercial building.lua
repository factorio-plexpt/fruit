local entity_util = require("lib.entity_util")

local name = "advanced-farm"

-- 定义 advanced-farm 实体
local advanced_farm_entity = {
    type = "assembling-machine",
    name = name,
    icon = "__fruit__/graphics/entity/advanced-farm.png",
    icon_size = 1024,
    flags = { "placeable-neutral", "placeable-player", "player-creation", "get-by-unit-number" },
    minable = {
        mining_time = 0.5,
        result = name
    },
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = entity_util.shrinkBox(entity_util.box7),
    selection_box = entity_util.box7,
    fluid_boxes = entity_util.create_boxes_normal(7, 3, 2),
    fast_replaceable_group = name,
    module_slots = 4,
    crafting_categories = { "fruit_plant", "plant" },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = { pollution = 1 }, -- 根据需要调整排放值
    },
    energy_usage = "800kW",
    fluid_boxes_off_when_no_fluid_recipe = true,
    crafting_speed = 1,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    circuit_wire_max_distance = 20,
    allowed_effects = { "consumption", "speed", "pollution", "quality" },
    heating_energy = feature_flags["freezing"] and "100kW" or nil,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    squeak_behaviour = false,
    graphics_set = {
        animation = {
            filename = "__fruit__/graphics/entity/advanced-farm.png",
            priority = "extra-high",
            width = 1024,
            height = 1024,
            frame_count = 1,
            line_length = 1,
            repeat_count = 1,
            animation_speed = 1,
            scale = 0.28,
            shift = { 0, -0.5 },
        },
    }
}



-- 定义 advanced-farm 科技
TECHNOLOGY {
    type = "technology",
    name = name,
    icon = "__fruit__/graphics/entity/advanced-farm.png",
    icon_size = 1024,
    effects = {
        {
            type = "unlock-recipe",
            recipe = name
        }
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 }
        },
        time = 5
    },
    order = "a-b-c"
}

-- 定义 advanced-farm 配方
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


-- 添加实体、配方和科技到游戏中
data:extend({
    advanced_farm_entity,
})

-- 创建新物品
ITEM {
    type = "item",
    name = name,
    icon = "__fruit__/graphics/entity/advanced-farm.png",
    icon_size = 1024,
    subgroup = "fruit_machine",
    order = "a[advanced-farm]",
    stack_size = 10,
    place_result = advanced_farm_entity.name
}
