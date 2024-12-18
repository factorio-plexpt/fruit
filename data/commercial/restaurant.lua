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
    prerequisites = { "food-command-center" },
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 }
        },
        time = 60
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

---
axax = {
    allowed_effects = {
        "consumption",
        "speed",
        "pollution",
        "quality"
    },
    cant_insert_at_source_message_key = "inventory-restriction.cant-be-recycled",
    collision_box = {
        {
            -0.7,
            -1.7
        },
        {
            0.7,
            1.7
        }
    },
    corpse = "medium-remnants",
    crafting_categories = {
        "recycling",
        "recycling-or-hand-crafting"
    },
    crafting_speed = 0.5,
    custom_input_slot_tooltip_key = "recycler-input-slot-tooltip",
    energy_source = {
        emissions_per_minute = {
            pollution = 2
        },
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_usage = "180kW",
    fast_replaceable_group = "recycler",
    fast_transfer_modules_into_module_slots_only = true,
    flags = {
        "placeable-neutral",
        "placeable-player",
        "player-creation"
    },
    graphics_set = {
        animation = {
            east = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-E.png",
                        frame_count = 64,
                        height = 184,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.0625,
                            -0.34375
                        },
                        width = 280
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-E-shadow.png",
                        frame_count = 64,
                        height = 112,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.828125,
                            0.25
                        },
                        width = 374
                    }
                }
            },
            north = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-N.png",
                        frame_count = 64,
                        height = 308,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.015625,
                            -0.359375
                        },
                        width = 142
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-N-shadow.png",
                        frame_count = 64,
                        height = 252,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.90625,
                            0.0625
                        },
                        width = 240
                    }
                }
            },
            south = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-S.png",
                        frame_count = 64,
                        height = 276,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            -0.015625,
                            -0.09375
                        },
                        width = 142
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-S-shadow.png",
                        frame_count = 64,
                        height = 252,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.828125,
                            0.21875
                        },
                        width = 246
                    }
                }
            },
            west = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-W.png",
                        frame_count = 64,
                        height = 172,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            -0.03125,
                            -0.25
                        },
                        width = 260
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-W-shadow.png",
                        frame_count = 64,
                        height = 116,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.515625,
                            0.28125
                        },
                        width = 314
                    }
                }
            }
        },
        frozen_patch = {
            east = {
                filename = "__quality__/graphics/entity/recycler/recycler-E-frozen.png",
                height = 184,
                priority = "high",
                scale = 0.5,
                shift = {
                    0.0625,
                    -0.34375
                },
                width = 280
            },
            north = {
                filename = "__quality__/graphics/entity/recycler/recycler-N-frozen.png",
                height = 308,
                priority = "high",
                scale = 0.5,
                shift = {
                    0.015625,
                    -0.359375
                },
                width = 142
            },
            south = {
                filename = "__quality__/graphics/entity/recycler/recycler-S-frozen.png",
                height = 276,
                line_length = 8,
                priority = "high",
                scale = 0.5,
                shift = {
                    -0.015625,
                    -0.09375
                },
                width = 142
            },
            west = {
                filename = "__quality__/graphics/entity/recycler/recycler-W-frozen.png",
                height = 172,
                priority = "high",
                scale = 0.5,
                shift = {
                    -0.03125,
                    -0.25
                },
                width = 260
            }
        },
        working_visualisations = {
            {
                east_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-E-lights.png",
                    frame_count = 64,
                    height = 128,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0,
                        -0.34375
                    },
                    width = 250
                },
                north_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-N-lights.png",
                    frame_count = 64,
                    height = 288,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0.078125,
                        -0.484375
                    },
                    width = 120
                },
                south_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-S-lights.png",
                    frame_count = 64,
                    height = 258,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0.046875,
                        -0.0625
                    },
                    width = 120
                },
                west_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-W-lights.png",
                    frame_count = 64,
                    height = 158,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        -0.03125,
                        -0.328125
                    },
                    width = 244
                }
            },
            {
                animation = {
                    animation_speed = 0.5,
                    filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
                    frame_count = 47,
                    height = 188,
                    line_length = 16,
                    scale = 0.5,
                    shift = {
                        -0.0625,
                        -1.25
                    },
                    width = 90
                },
                apply_recipe_tint = "tertiary",
                constant_speed = true,
                east_position = {
                    1.515625,
                    -0.828125
                },
                fadeout = true,
                north_position = {
                    0.546875,
                    -2.75
                },
                render_layer = "wires",
                south_position = {
                    -0.5,
                    0.171875
                },
                west_position = {
                    -1.34375,
                    -1.59375
                }
            },
            {
                animation = {
                    animation_speed = 0.5,
                    filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
                    frame_count = 47,
                    height = 84,
                    line_length = 16,
                    scale = 0.5,
                    shift = {
                        0,
                        -0.4375
                    },
                    width = 40
                },
                apply_recipe_tint = "quaternary",
                constant_speed = true,
                east_position = {
                    1.515625,
                    -0.828125
                },
                fadeout = true,
                north_position = {
                    0.546875,
                    -2.75
                },
                render_layer = "wires",
                south_position = {
                    -0.5,
                    0.171875
                },
                west_position = {
                    -1.34375,
                    -1.59375
                }
            }
        }
    },
    graphics_set_flipped = {
        animation = {
            east = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-E.png",
                        frame_count = 64,
                        height = 172,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.3125,
                            -0.25
                        },
                        width = 260
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-E-shadow.png",
                        frame_count = 64,
                        height = 118,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            1.0625,
                            0.296875
                        },
                        width = 352
                    }
                }
            },
            north = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-N.png",
                        frame_count = 64,
                        height = 308,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            -0.015625,
                            -0.359375
                        },
                        width = 142
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-N-shadow.png",
                        frame_count = 64,
                        height = 252,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.859375,
                            0.0625
                        },
                        width = 244
                    }
                }
            },
            south = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-S.png",
                        frame_count = 64,
                        height = 276,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.015625,
                            -0.09375
                        },
                        width = 140
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-S-shadow.png",
                        frame_count = 64,
                        height = 252,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.890625,
                            0.21875
                        },
                        width = 232
                    }
                }
            },
            west = {
                layers = {
                    {
                        animation_speed = 4,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-W.png",
                        frame_count = 64,
                        height = 184,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.0625,
                            -0.34375
                        },
                        width = 280
                    },
                    {
                        animation_speed = 4,
                        draw_as_shadow = true,
                        filename = "__quality__/graphics/entity/recycler/recycler-flipped-W-shadow.png",
                        frame_count = 64,
                        height = 114,
                        line_length = 8,
                        priority = "high",
                        scale = 0.5,
                        shift = {
                            0.671875,
                            0.25
                        },
                        width = 342
                    }
                }
            }
        },
        frozen_patch = {
            east = {
                filename = "__quality__/graphics/entity/recycler/recycler-flipped-E-frozen.png",
                height = 172,
                priority = "high",
                scale = 0.5,
                shift = {
                    0.3125,
                    -0.25
                },
                width = 260
            },
            north = {
                filename = "__quality__/graphics/entity/recycler/recycler-flipped-N-frozen.png",
                height = 308,
                priority = "high",
                scale = 0.5,
                shift = {
                    -0.015625,
                    -0.359375
                },
                width = 142
            },
            south = {
                filename = "__quality__/graphics/entity/recycler/recycler-flipped-S-frozen.png",
                height = 276,
                priority = "high",
                scale = 0.5,
                shift = {
                    0.015625,
                    -0.09375
                },
                width = 140
            },
            west = {
                filename = "__quality__/graphics/entity/recycler/recycler-flipped-W-frozen.png",
                height = 184,
                priority = "high",
                scale = 0.5,
                shift = {
                    0.0625,
                    -0.34375
                },
                width = 280
            }
        },
        working_visualisations = {
            {
                east_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-flipped-E-lights.png",
                    frame_count = 64,
                    height = 160,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0.296875,
                        -0.3125
                    },
                    width = 244
                },
                north_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-flipped-N-lights.png",
                    frame_count = 64,
                    height = 288,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        -0.078125,
                        -0.46875
                    },
                    width = 122
                },
                south_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-flipped-S-lights.png",
                    frame_count = 64,
                    height = 244,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        -0.03125,
                        -0.1875
                    },
                    width = 120
                },
                west_animation = {
                    animation_speed = 4,
                    blend_mode = "additive",
                    draw_as_glow = true,
                    filename = "__quality__/graphics/entity/recycler/recycler-flipped-W-lights.png",
                    frame_count = 64,
                    height = 134,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0.203125,
                        -0.375
                    },
                    width = 238
                }
            },
            {
                animation = {
                    animation_speed = 0.5,
                    filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
                    frame_count = 47,
                    height = 188,
                    line_length = 16,
                    scale = 0.5,
                    shift = {
                        -0.0625,
                        -1.25
                    },
                    width = 90
                },
                apply_recipe_tint = "tertiary",
                constant_speed = true,
                east_position = {
                    1.59375,
                    -1.578125
                },
                fadeout = true,
                north_position = {
                    -0.5625,
                    -2.75
                },
                render_layer = "wires",
                south_position = {
                    0.484375,
                    0.171875
                },
                west_position = {
                    -1.375,
                    -0.859375
                }
            },
            {
                animation = {
                    animation_speed = 0.5,
                    filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
                    frame_count = 47,
                    height = 84,
                    line_length = 16,
                    scale = 0.5,
                    shift = {
                        0,
                        -0.4375
                    },
                    width = 40
                },
                apply_recipe_tint = "quaternary",
                constant_speed = true,
                east_position = {
                    1.59375,
                    -1.578125
                },
                fadeout = true,
                north_position = {
                    -0.5625,
                    -2.75
                },
                render_layer = "wires",
                south_position = {
                    0.484375,
                    0.171875
                },
                west_position = {
                    -1.375,
                    -0.859375
                }
            }
        }
    },
    heating_energy = "100kW",
    icon = "__quality__/graphics/icons/recycler.png",
    icon_draw_specification = {
        shift = {
            0,
            -0.55
        }
    },
    icons_positioning = {
        {
            inventory_index = 4,
            shift = {
                0,
                0.2
            }
        }
    },
    impact_category = "metal",
    max_health = 300,
    minable = {
        mining_time = 0.2,
        result = "recycler"
    },
    module_slots = 4,
    name = "recycler",
    resistances = {
        {
            percent = 80,
            type = "fire"
        }
    },
    result_inventory_size = 12,
    selection_box = {
        {
            -0.9,
            -1.85
        },
        {
            0.9,
            1.85
        }
    },
    source_inventory_size = 1,
    type = "furnace",
    vector_to_place_result = {
        -0.5,
        -2.3
    },
}
