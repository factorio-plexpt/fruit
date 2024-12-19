local entity_util = require("lib.entity_util")

-- 定义水果燃料发电机实体
local fruit_fuel_generator_entity = {
    type = "burner-generator",
    name = "fruit-fuel-generator",
    icon = "__fruit__/graphics/entity/fruit-fuel-generator.png",
    icon_size = 1024,
    flags = { "placeable-neutral", "player-creation", "get-by-unit-number" },
    minable = { mining_time = 0.5, result = "fruit-fuel-generator" },
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = entity_util.shrinkBox(entity_util.box5),
    selection_box = entity_util.box5,
    perceived_performance = { minimum = 0.25, performance_to_activity_rate = 2.0 },
    fast_replaceable_group = "fruit-fuel-generator",
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output"
    },
    burner = {
        type = "burner",
        fuel_categories = { "fruit" },
        effectivity = 0.5,
        fuel_inventory_size = 2,
        emissions_per_minute = { pollution = 2 },
        smoke = {
            {
                name = "smoke",
                north_position = { 0.9, 0.0 },
                east_position = { -2.0, -2.0 },
                deviation = { 0.1, 0.1 },
                frequency = 9
            }
        }
    },
    max_power_output = "1MW",
    squeak_behaviour = false,
    animation = {
        north = {
            filename = "__fruit__/graphics/entity/fruit-fuel-generator.png",
            width = 1024,
            height = 1024,
            frame_count = 1,
            line_length = 1,
            scale = 0.2,
            shift = { 0.0, 0.0 }
        },
    },
}


-- 定义水果燃料发电机科技
TECHNOLOGY {
    type = "technology",
    name = "fruit-fuel-generator",
    icon = "__fruit__/graphics/entity/fruit-fuel-generator.png",
    icon_size = 1024,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "fruit-fuel-generator"
        }
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 5
    },
}
-- 定义水果燃料发电机配方
RECIPE {
    type = "recipe",
    name = "fruit-fuel-generator",
    ingredients = {
        { type = "item", name = "electronic-circuit", amount = 5 },
        { type = "item", name = "iron-gear-wheel", amount = 10 },
        { type = "item", name = "iron-plate", amount = 100 },
    },
    results = {
        { type = "item", name = "fruit-fuel-generator", amount = 1 },
    },
    enabled = false,
    energy_required = 2,
    category = "crafting"
}



-- 添加实体、配方和科技到游戏中
data:extend({
    fruit_fuel_generator_entity,
})

-- 创建新物品
ITEM {
    type = "item",
    name = "fruit-fuel-generator",
    icon = "__fruit__/graphics/entity/fruit-fuel-generator.png",
    icon_size = 1024,
    subgroup = "fruit_machine",
    order = "a[fruit-fuel-generator]",
    stack_size = 10,
    place_result = fruit_fuel_generator_entity.name
}
