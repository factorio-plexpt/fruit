local pipe_pic = assembler3pipepictures()
local pipecoverpic = pipecoverspictures()

local box3 = { { -1.5, -1.5 }, { 1.5, 1.5 } }  -- 调整为3的大小
local box4 = { { -2, -2 }, { 2, 2 } }  -- 保持不变
local box5 = { { -2.5, -2.5 }, { 2.5, 2.5 } }  -- 保持不变
local box6 = { { -3, -3 }, { 3, 3 } }  -- 调整为6的大小
local box7 = { { -3.5, -3.5 }, { 3.5, 3.5 } }  -- 调整为7的大小
local box8 = { { -4, -4 }, { 4, 4 } }  -- 调整为8的大小
local box11 = { { -5.5, -5.5 }, { 5.5, 5.5 } }

local function shrinkBox(box)
    -- 获取 box 的左下角和右上角坐标
    local leftBottom = box[1]
    local rightTop = box[2]

    -- 计算缩小后的坐标
    local newLeftBottom = { leftBottom[1] + 0.1, leftBottom[2] + 0.1 }
    local newRightTop = { rightTop[1] - 0.1, rightTop[2] - 0.1 }

    -- 返回缩小后的 box
    return { newLeftBottom, newRightTop }
end

-- 容器大小，每个方向管道，间距1
local function create_boxes_normal(size, num_pipes, pipe_spacing)
    local total_width = (num_pipes - 1) * pipe_spacing -- 所有管道占据的总宽度
    local position = size / 2 - 0.1 -- 计算管道中心到容器边缘的距离（0.2是管道自身直径的估计值）

    local boxes = {}
    for direction_index, direction in ipairs({ defines.direction.north, defines.direction.west, defines.direction.south, defines.direction.east }) do
        local connections = {}
        for i = 1, num_pipes do
            local offset = (i - (num_pipes + 1) / 2) * pipe_spacing -- 计算每个管道的偏移量
            local pipe_position = { 0, 0 }
            if direction == defines.direction.north then
                pipe_position = { offset, -position }
            elseif direction == defines.direction.west then
                pipe_position = { -position, offset }
            elseif direction == defines.direction.south then
                pipe_position = { offset, position }
            elseif direction == defines.direction.east then
                pipe_position = { position, offset }
            end
            table.insert(connections, { direction = direction, flow_direction = (direction_index > 2) and "output" or "input", position = pipe_position })
        end

        table.insert(boxes, {
            production_type = (direction_index > 2) and "output" or "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = connections,
            secondary_draw_orders = { north = -1 }
        })
    end
    return boxes
end

local function create_boxes(size)
    local position = size / 2 - 0.1
    return {
        -- 北
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -position } } },
            secondary_draw_orders = { north = -1 }
        },
        -- 西
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -position, -0 } } },
            secondary_draw_orders = { north = -1 }
        },
        -- 南
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, position } } },
            secondary_draw_orders = { north = -1 }
        },
        -- 东
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { position, 0 } } },
            secondary_draw_orders = { north = -1 }
        }
    }
end

local function create_boxes2(size)
    local position = size / 2 - 0.1 -- 调整位置以适应两个管道和间距
    local offset = 1 -- 管道之间的间距

    return {
        -- 北 (两个管道)
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = {
                { direction = defines.direction.north, flow_direction = "input", position = { -offset, -position } },
                { direction = defines.direction.north, flow_direction = "input", position = { offset, -position } },
            },
            secondary_draw_orders = { north = -1 }
        },
        -- 西 (两个管道)
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = {
                { direction = defines.direction.west, flow_direction = "input", position = { -position, -offset } },
                { direction = defines.direction.west, flow_direction = "input", position = { -position, offset } },
            },
            secondary_draw_orders = { north = -1 }
        },
        -- 南 (两个管道)
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = {
                { direction = defines.direction.south, flow_direction = "output", position = { -offset, position } },
                { direction = defines.direction.south, flow_direction = "output", position = { offset, position } },
            },
            secondary_draw_orders = { north = -1 }
        },
        -- 东 (两个管道)
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = {
                { direction = defines.direction.east, flow_direction = "output", position = { position, -offset } },
                { direction = defines.direction.east, flow_direction = "output", position = { position, offset } },
            },
            secondary_draw_orders = { north = -1 }
        }
    }
end

local function getStripes(path, max)

    local stripes = {}
    for i = 1, max do

        local s = {
            filename = "__fruit__/graphics/" .. path .. i .. ".png",
            width_in_frames = 1,
            height_in_frames = 1,
        }
        table.insert(stripes, s)
    end

    return stripes
end

local function getStripesAnimation(path, max, width, height, animation_speed, shift, scale)
    local animation = {
        slice = 1,
        animation_speed = animation_speed or 0.5,
        width = width,
        height = height,
        frame_count = max,
        draw_as_glow = true,
        direction_count = 1,
        shift = shift or util.by_pixel(0, 0),
        scale = scale or 1,
        stripes = getStripes(path, max)

    }

    return animation
end

if mods["space-age"] then


    local tower = table.deepcopy(data.raw["agricultural-tower"]["agricultural-tower"])

    tower.name = "super-tower"

    tower.minable.result = tower.name

    --	定义作物生长的随机偏移量，必须大于等于0且小于1。 默认0.25
    tower.random_growth_offset = 0
    --定义作物生长网格的瓦片大小，必须为正数。 默认3
    tower.growth_grid_tile_size = 4

    tower.input_inventory_size = 10

    tower.output_inventory_size = 10

    tower.radius = 8

    data:extend { tower }
    data:extend { {
                      type = "item",
                      subgroup = "fruit_machine",
                      name = tower.name,
                      icon = tower.icon,
                      icon_size = tower.icon_size,
                      place_result = tower.name,
                      order = tower.name,
                      stack_size = 20
                  },
    }

    RECIPE {
        type = "recipe",
        name = tower.name,
        enabled = false,
        energy_required = 1,
        ingredients = {
            { type = "item", name = "assembling-machine-1", amount = 2 },
            { type = "item", name = "iron-plate", amount = 100 },
            { type = "item", name = "steel-plate", amount = 100 },
            { type = "item", name = "electronic-circuit", amount = 20 },
        },
        results = { { type = "item", name = tower.name, amount = 1 } },
    }:add_unlock("food-processing")
end

local base = {
    type = "assembling-machine",
    name = "juice-extractor",
    icon = "__fruit__/graphics/entity/juicer-machine.png",
    icon_size = 1024,
    flags = { "placeable-neutral", "placeable-player", "player-creation", "get-by-unit-number" },
    minable = { mining_time = 1, result = "juice-extractor" },
    max_health = 500,
    inventory_size = 4,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    resistances = { { type = "fire", percent = 90 } },
    collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    fluid_boxes = {
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { -2, -2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 0, -2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 2, -2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        --北
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, -2 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, 0 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.west, flow_direction = "input", position = { -2.3, 2 } } },
            secondary_draw_orders = { north = -1 }
        },
        --{
        --    production_type = "input",
        --    volume = 1000,
        --    pipe_picture = pipe_pic,
        --    pipe_covers = pipecoverpic,
        --    pipe_connections = { { direction = defines.direction.north, flow_direction = "input", position = { 4, -4 } } },
        --    secondary_draw_orders = { north = -1 }
        --},
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { -2, 2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 0, 2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.south, flow_direction = "output", position = { 2, 2.3 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, -2 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, 0 } } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "input",
            volume = 1000,
            pipe_picture = pipe_pic,
            pipe_covers = pipecoverpic,
            pipe_connections = { { direction = defines.direction.east, flow_direction = "output", position = { 2.3, 2 } } },
            secondary_draw_orders = { north = -1 }
        },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__fruit__/graphics/entity/juicer-machine.png",
                    priority = "extra-high",
                    width = 512,
                    height = 512,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 36,
                    animation_speed = 3,
                    shift = { 0, -0.8 },
                    scale = 0.4,
                },
                {
                    filename = "__fruit__/graphics/entity/juicer-machine-pan.png",
                    priority = "extra-high",
                    width = 512,
                    height = 512,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 36,
                    animation_speed = 3,
                    shift = { 0, -0.8 },
                    scale = 0.4,
                },
            },
        },

        working_visualisations = {
            {
                always_draw = true,
                apply_recipe_tint = "primary",
                animation = {
                    filename = "__fruit__/graphics/entity/juicer-machine-tint.png",
                    priority = "extra-high",
                    width = 512,
                    height = 512,
                    frame_count = 1,
                    line_length = 1,
                    repeat_count = 36,
                    priority = "high",
                    animation_speed = 3,
                    scale = 0.4,
                    shift = { 0, -0.8 },
                    --tint_as_overlay = true,
                },
            },
            {
                always_draw = true,
                animation = {
                    filename = "__fruit__/graphics/entity/juicer-machine-tint3.png",
                    priority = "extra-high",
                    ["file_count"] = 1,
                    ["width"] = 104,
                    ["height"] = 104,
                    ["line_length"] = 6,
                    ["lines_per_file"] = 6,
                    ["shift"] = { x = 3.2 / 64, y = -72 / 64 - 0.8 },
                    ["sprite_count"] = 36,
                    frame_count = 36,
                    animation_speed = 3,
                    scale = 0.4,
                    blend_mode = "multiplicative-with-alpha",
                },
            },
        }
    },
    crafting_categories = { "juice", },
    crafting_speed = 1,
    impact_category = "metal",
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 10
        }
    },
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    circuit_wire_max_distance = 20,
    energy_usage = "100kW",
    module_slots = 4,
    allowed_effects = { "consumption", "speed", "productivity", "pollution", "quality" },
    heating_energy = feature_flags["freezing"] and "100kW" or nil,
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    squeak_behaviour = false,
    working_sound = {
        audible_distance_modifier = 0.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        sound = {
            filename = "__base__/sound/assembling-machine-t3-1.ogg",
            volume = 0.45
        }
    }
}
local juice = table.deepcopy(base)
juice.collision_box = shrinkBox(box3)
juice.selection_box = box3
juice.fluid_boxes = create_boxes2(3)
juice.icon_size = 512

--Jam Machine
local jam = table.deepcopy(base)
jam.name = "jam-machine"
jam.icon = "__fruit__/graphics/entity/jam-machine.png"
jam.icon_size = 512
jam.minable.result = "jam-machine"
jam.crafting_categories = { "jam", }
jam.collision_box = shrinkBox(box4)
jam.selection_box = box4
jam.fluid_boxes = create_boxes_normal(4, 2, 2)
jam.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/jam-machine.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -1 },
                scale = 0.5,
            },
        },
    },
}

--fermentation chamber
local fermentation = table.deepcopy(base)
fermentation.name = "fermentation-chamber"
fermentation.icon = "__fruit__/graphics/entity/fermentation-chamber.png"
fermentation.icon_size = 512
fermentation.minable.result = "fermentation-chamber"
fermentation.crafting_categories = { "fermentation", }
fermentation.collision_box = shrinkBox(box4)
fermentation.selection_box = box4
fermentation.fluid_boxes = create_boxes_normal(4, 2, 2)

fermentation.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/fermentation-chamber.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -1.2 },
                scale = 0.5,
            },
        },
    },
}
--oven
local oven = table.deepcopy(base)
oven.name = "oven"
oven.icon = "__fruit__/graphics/entity/oven.png"
oven.icon_size = 512
oven.minable.result = "oven"
oven.crafting_categories = { "oven", }
oven.fluid_boxes = create_boxes_normal(5, 3, 2)
oven.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/oven.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, 0.3 },
                scale = 0.5,
            },
        },
    },
}

--icecream
local icecream = table.deepcopy(base)
icecream.name = "icecream-machine"
icecream.icon = "__fruit__/graphics/entity/icecream.png"
icecream.icon_size = 512
icecream.minable.result = "icecream-machine"
icecream.crafting_categories = { "icecream", }
icecream.collision_box = shrinkBox(box3)
icecream.selection_box = box3
icecream.fluid_boxes = create_boxes2(3)
icecream.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/icecream.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -1.2 },
                scale = 0.5,
            },
        },
    },
    working_visualisations = {
        {
            always_draw = true,
            apply_recipe_tint = "primary",
            animation = {
                filename = "__fruit__/graphics/entity/icecream.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -1.2 },
                scale = 0.5,
                --tint_as_overlay = true,
            },
        },
    }
}
--bbq
local bbq = table.deepcopy(base)
bbq.name = "bbq"
bbq.icon = "__fruit__/graphics/entity/bbq.png"
bbq.icon_size = 512
bbq.minable.result = "bbq"
bbq.crafting_categories = { "bbq", }
bbq.collision_box = shrinkBox(box5)
bbq.selection_box = box5
bbq.fluid_boxes = create_boxes_normal(5, 3, 2)
bbq.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/bbq.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -0.4 },
                scale = 0.5,
            },
        },
    },
}

--agitator
local agitator = table.deepcopy(base)
agitator.name = "agitator"
agitator.icon = "__fruit__/graphics/entity/agitator.png"
agitator.icon_size = 512
agitator.minable.result = "agitator"
agitator.crafting_categories = { "agitator", }
agitator.collision_box = shrinkBox(box3)
agitator.selection_box = box3
agitator.fluid_boxes = create_boxes2(3)
agitator.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/agitator.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { -0.05, -1.2 },
                scale = 0.5,
            },
        },
    },
}

--Grinder
local grinder = table.deepcopy(base)
grinder.name = "grinder"
grinder.icon = "__fruit__/graphics/entity/grinder.png"
grinder.icon_size = 512
grinder.minable.result = "grinder"
grinder.crafting_categories = { "grinder", }
grinder.collision_box = shrinkBox(box4)
grinder.selection_box = box4
grinder.fluid_boxes = create_boxes_normal(4, 2, 2)

grinder.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/grinder.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -1 },
                scale = 0.5,
            },
        },
    },
}
--oak
local oak = table.deepcopy(base)
oak.name = "oak"
oak.icon = "__fruit__/graphics/entity/oak.png"
oak.icon_size = 512
oak.minable.result = "oak"
oak.crafting_categories = { "oak", }
oak.collision_box = shrinkBox(box4)
oak.selection_box = box4
oak.fluid_boxes = create_boxes_normal(4, 2, 2)

oak.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/oak.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -0.3 },
                scale = 0.4,
            },
        },
    },
}
--incubator
local incubator = table.deepcopy(base)
incubator.name = "incubator"
incubator.type = "furnace"
incubator.vector_to_place_result = { 0, 2.5 }
incubator.source_inventory_size = 1
incubator.result_inventory_size = 1
incubator.icon = "__fruit__/graphics/entity/incubator.png"
incubator.icon_size = 512
incubator.minable.result = "incubator"
incubator.crafting_categories = { "incubator", }
incubator.collision_box = shrinkBox(box4)
incubator.selection_box = box4
incubator.fluid_boxes = nil

incubator.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/incubator.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -0.3 },
                scale = 0.4,
            },
        },
    },
}
--dough-press
local press = table.deepcopy(base)
press.name = "dough-press"
press.icon = "__fruit__/graphics/entity/dough-press.png"
press.icon_size = 512
press.minable.result = "dough-press"
press.crafting_categories = { "press", }
press.collision_box = shrinkBox(box4)
press.selection_box = box4
press.fluid_boxes = create_boxes_normal(4, 2, 2)

press.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/dough-press.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, -1 },
                scale = 0.5,
            },
        },
    },
}

--cutting-board
local board = table.deepcopy(base)
board.name = "cutting-board"
board.icon = "__fruit__/graphics/entity/cutting-board.png"
board.icon_size = 512
board.minable.result = "cutting-board"
board.crafting_categories = { "cutting", }
board.collision_box = shrinkBox(box4)
board.selection_box = box4
board.fluid_boxes = create_boxes_normal(4, 2, 2)

board.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/cutting-board.png",
                priority = "extra-high",
                width = 512,
                height = 512,
                frame_count = 1,
                line_length = 1,
                repeat_count = 2,
                animation_speed = 0.3,
                shift = { 0, 0 },
                scale = 0.4,
            },
        },
    },
}

--washer
local washer = table.deepcopy(base)
washer.name = "washer"
washer.icon = "__fruit__/graphics/entity/washer/washer-icon.png"
washer.icon_size = 64
washer.minable.result = "washer"
washer.crafting_categories = { "washer", }
washer.collision_box = shrinkBox(box3)
washer.selection_box = box3
washer.fluid_boxes = create_boxes2(3)

washer.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/washer/scrubber-hr-shadow.png",
                priority = "high",
                size = { 400, 350 },
                shift = { 0, 0 },
                scale = 0.5,
                line_length = 1,
                repeat_count = 60,
                draw_as_shadow = true,
                animation_speed = 0.3,
                shift = { 0, -0.8 },

            },
            {
                filename = "__fruit__/graphics/entity/washer/scrubber-hr-animation.png",
                size = { 210, 290 },
                shift = { 0, 0 },
                scale = 0.5,
                line_length = 8,
                frame_count = 60,
                animation_speed = 0.3,
                shift = { 0, -0.8 },
            },
        },
    },
}

--husker
local husker = table.deepcopy(base)
husker.name = "husker"
husker.icon = "__fruit__/graphics/entity/husker/icon.png"
husker.icon_size = 64
husker.minable.result = "husker"
husker.crafting_categories = { "husker", }
husker.collision_box = shrinkBox(box6)
husker.selection_box = box6
husker.fluid_boxes = create_boxes_normal(6, 2, 3)

husker.graphics_set = {
    animation = {
        layers = {
            {
                filename = "__fruit__/graphics/entity/husker/shadow.png",
                priority = "high",
                size = { 800, 600 },
                shift = { 0, 0 },
                scale = 0.5,
                line_length = 1,
                frame_count = 1,
                repeat_count = 1,
                draw_as_shadow = true,
                animation_speed = 0.25,
            },
            {
                filename = "__fruit__/graphics/entity/husker/animation.png",
                size = { 400, 400 },
                shift = { 0, 0 },
                scale = 0.5,
                line_length = 1,
                frame_count = 1,
                animation_speed = 0.25,
            },
        },
    },
}

---
local pot = {
    type = "assembling-machine",
    name = "pot",
    icon = "__fruit__/graphics/entity/pot/1.png",
    icon_size = 400,
    max_health = 500,
    flags = { "not-rotatable", "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "pot" },
    crafting_categories = { "pot", "pie" },
    crafting_speed = 1,
    collision_box = { { -1.4, -1.4 }, { 1.4, 1.4 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    scale_entity_info_icon = true,
    always_draw_idle_animation = true,
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
                    height = 146,
                    priority = "extra-high",
                    scale = 0.5,
                    frame_count = 1,
                    repeat_count = 61,
                    shift = { 0, 1.2 },
                    width = 151
                },
                {
                    draw_as_shadow = true,
                    filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
                    priority = "extra-high",
                    height = 74,
                    frame_count = 1,
                    repeat_count = 61,
                    scale = 0.5,
                    shift = { 0.45, 1.4 },
                    width = 164
                },
                getStripesAnimation("entity/pot/", 61, 400, 400, nil, util.by_pixel(0, 8), 0.5),
            }
        },
        working_visualisations = {
            {
                animation = {
                    layers = {
                        {
                            draw_as_glow = true,
                            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
                            frame_count = 48,
                            height = 100,
                            line_length = 8,
                            priority = "extra-high",
                            scale = 0.5,
                            shift = { 0, 1.2 },
                            width = 41
                        },
                        {
                            blend_mode = "additive",
                            draw_as_glow = true,
                            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-light.png",
                            height = 144,
                            repeat_count = 48,
                            scale = 0.5,
                            shift = { 0, 1.2 },
                            width = 106
                        }
                    }
                },
                effect = "flicker",
                fadeout = true
            },
            --{
            --    animation = {
            --        blend_mode = "additive",
            --        draw_as_light = true,
            --        filename = "__base__/graphics/entity/stone-furnace/stone-furnace-ground-light.png",
            --        height = 110,
            --        repeat_count = 48,
            --        scale = 0.5,
            --        shift = { 0, 2.3 },
            --        width = 116
            --    },
            --    effect = "flicker",
            --    fadeout = true
            --}
        },
        water_reflection = {
            orientation_to_variation = false,
            pictures = {
                filename = "__base__/graphics/entity/stone-furnace/stone-furnace-reflection.png",
                height = 16,
                priority = "extra-high",
                scale = 5,
                shift = {
                    0,
                    1.09375
                },
                variation_count = 1,
                width = 16
            },
            rotate = false
        },

    },

    energy_usage = "100W",
    energy_source = {
        type = "burner",
        fuel_categories = { "chemical" },
        effectivity = 1,
        fuel_inventory_size = 2,
        emissions_per_minute = { pollution = 10 },
        light_flicker = {
            color = { 0, 0, 0 },
            minimum_intensity = 0.6,
            maximum_intensity = 0.95
        },
        smoke = {
            {
                name = "smoke",
                deviation = { 0.1, 0.1 },
                frequency = 5,
                position = { 0.0, -0.8 },
                starting_vertical_speed = 0.08,
                starting_frame_deviation = 60
            }
        }
    },
    result_inventory_size = 0,
    source_inventory_size = 0,
    squeak_behaviour = false,
    se_allow_in_space = true
}
pot.fluid_boxes = create_boxes_normal(3, 2, 2)

local machines = {
    juice,
    jam,
    fermentation,
    oven,
    icecream,
    agitator,
    grinder,
    oak,
    incubator,
    press,
    board,
    bbq,
    washer,
    husker,
    pot,
}

for k, machine in pairs(machines) do
    ITEM {
        type = "item",
        subgroup = "fruit_machine",
        name = machine.name,
        icon = machine.icon,
        icon_size = machine.icon_size,
        place_result = machine.name,
        order = machine.name,
        stack_size = 20
    }

    RECIPE {
        type = "recipe",
        name = machine.name,
        enabled = false,
        energy_required = 2,
        ingredients = {
            { type = "item", name = "assembling-machine-1", amount = 2 },
            { type = "item", name = "iron-plate", amount = 100 },
            { type = "item", name = "steel-plate", amount = 100 },
            { type = "item", name = "electronic-circuit", amount = 20 },
        },
        results = { { type = "item", name = machine.name, amount = 1, probability = 0.7 } },
    }:add_unlock("food-processing")

end

data:extend(machines)
