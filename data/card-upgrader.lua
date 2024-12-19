local entity_util = require("lib.entity_util")

local name = "core-card-upgrader"

local icon = "__fruit__/graphics/entity/core-card-upgrader.png"
local icon_size = 1024
local crafting_categories = { "food-core-card" }

-- 定义实体
data:extend { {
                  type = "furnace",
                  name = name,
                  icon = icon,
                  icon_size = icon_size,
                  flags = { "placeable-neutral", "player-creation", "get-by-unit-number" },
                  minable = { mining_time = 0.5, result = name },
                  max_health = 500,
                  corpse = "big-remnants",
                  dying_explosion = "big-explosion",
                  resistances = { { type = "fire", percent = 70 } },
                  collision_box = entity_util.shrinkBox(entity_util.box6),
                  selection_box = entity_util.box6,
                  --fluid_boxes = entity_util.create_boxes_normal(7, 3, 2),
                  fast_replaceable_group = name,
                  module_slots = 2,
                  source_inventory_size = 1,
                  result_inventory_size = 1,
                  cant_insert_at_source_message_key = "fruit.core-card-upgrader-warning",
                  crafting_categories = crafting_categories,
                  energy_source = {
                      type = "burner",
                      fuel_categories = { "fruit" },
                      effectivity = 1,
                      fuel_inventory_size = 4,
                      emissions_per_minute = { pollution = 100 }, -- 根据需要调整排放值
                      light_flicker = {
                          color = { 0, 0, 0 },
                          minimum_intensity = 0.6,
                          maximum_intensity = 0.95
                      }
                  },
                  energy_usage = "5MW",
                  fluid_boxes_off_when_no_fluid_recipe = true,
                  crafting_speed = 1,
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
                          scale = 0.28,
                          shift = { 0, -0.5 },
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
    prerequisites = { "food-core-card" },
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
