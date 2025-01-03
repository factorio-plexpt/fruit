local entity_util = require("lib.entity_util")

local name = "restaurant"

local icon = "__fruit__/graphics/entity/restaurant.png"
local icon_size = 512
local crafting_categories = { "fruit_order_restaurant" }

-- 定义实体
data:extend { {
                  type = "assembling-machine",
                  name = name,
                  icon = icon,
                  icon_size = icon_size,
                  flags = { "placeable-neutral", "placeable-player", "player-creation", "get-by-unit-number" },
                  minable = { mining_time = 0.5, result = name },
                  max_health = 500,
                  corpse = "big-remnants",
                  dying_explosion = "big-explosion",
                  resistances = { { type = "fire", percent = 70 } },
                  collision_box = entity_util.shrinkBox(entity_util.box5),
                  selection_box = entity_util.box5,
                  vector_to_place_result = {
                      0,
                      -2.6
                  },
                  fast_replaceable_group = name,
                  module_slots = 4,
                  trash_inventory_size = 1000,
                  crafting_categories = crafting_categories,
                  show_recipe_icon = false,
                  energy_source = {
                      type = "electric",
                      usage_priority = "secondary-input",
                      emissions_per_minute = { pollution = 1 }, -- 根据需要调整排放值
                  },
                  energy_usage = "800kW",
                  fluid_boxes_off_when_no_fluid_recipe = true,
                  crafting_speed = 1,
                  circuit_connector = circuit_connector_definitions["assembling-machine"],
                  circuit_wire_max_distance = 40,
                  allowed_effects = { "consumption", "speed", "pollution" },
                  heating_energy = feature_flags["freezing"] and "100kW" or nil,
                  open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
                  close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
                  squeak_behaviour = false,
                  graphics_set = {
                      animation = {
                          filename = icon,
                          priority = "extra-high",
                          size = icon_size,
                          frame_count = 1,
                          line_length = 1,
                          repeat_count = 1,
                          animation_speed = 1,
                          scale = 0.37,
                          shift = { 0, -0.2 },
                      },
                  }
              }
}



-- 定义 advanced-farm 科技
TECHNOLOGY {
    type = "technology",
    name = name,
    icon = icon,
    icon_size = icon_size,
    effects = {
        {
            type = "unlock-recipe",
            recipe = name
        }
    },
    prerequisites = { "food-core-card"},
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 }
        },
        time = 5
    },
    order = "a"
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

-- 创建新物品
ITEM {
    type = "item",
    name = name,
    icon = icon,
    icon_size = icon_size,
    subgroup = "fruit_machine",
    order = name,
    stack_size = 10,
    place_result = name
}
