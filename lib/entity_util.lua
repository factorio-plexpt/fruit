local pipe_pic = assembler3pipepictures()
local pipecoverpic = pipecoverspictures()

local entity_util = {}

entity_util.box3 = { { -1.5, -1.5 }, { 1.5, 1.5 } }  -- 调整为3的大小
entity_util.box4 = { { -2, -2 }, { 2, 2 } }  -- 保持不变
entity_util.box5 = { { -2.5, -2.5 }, { 2.5, 2.5 } }  -- 保持不变
entity_util.box6 = { { -3, -3 }, { 3, 3 } }  -- 调整为6的大小
entity_util.box7 = { { -3.5, -3.5 }, { 3.5, 3.5 } }  -- 调整为7的大小
entity_util.box8 = { { -4, -4 }, { 4, 4 } }  -- 调整为8的大小
entity_util.box11 = { { -5.5, -5.5 }, { 5.5, 5.5 } }

function entity_util.shrinkBox(box)
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
function entity_util.create_boxes_normal(size, num_pipes, pipe_spacing)
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

function entity_util.create_boxes(size)
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

function entity_util.create_boxes2(size)
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

function entity_util.getStripes(path, max)

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

function entity_util.getStripesAnimation(path, max, width, height, animation_speed, shift, scale)
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
        stripes = entity_util.getStripes(path, max)

    }

    return animation
end

return entity_util
