-- https://github.com/ClaudeMetz/UntitledGuiGuide/wiki/Topic:-Modifying-Vanilla-GUIs
local ENTITY_NAME = "food-command-center"

local function debug_log(str)
    --game.print(str)
    --log(str)

end


-- 存储所有 corehub 实体的表，按 force 和 surface 分类
-- 当玩家放置实体时触发的事件
local function on_built_corehub (entity)

    local force_name = entity.force.name
    local surface_name = entity.surface.name

    -- 初始化 force 和 surface 的存储表
    storage.fruit.corehubs[force_name] = storage.fruit.corehubs[force_name] or {}

    -- 记录实体的 ID 和实体本身
    storage.fruit.corehubs[force_name][surface_name] = entity.unit_number
    debug_log("Corehub placed! Force: " .. force_name .. ", Surface: " .. surface_name .. ", ID: " .. entity.unit_number)
end

-- 当实体被移除时触发的事件
local function on_entity_died(event)
    local entity = event.entity
    if not entity or not entity.valid or entity.name ~= ENTITY_NAME then
        return
    end
    -- 如果被移除的实体是 corehub，从表中删除它
    local force_name = entity.force.name
    local surface_name = entity.surface.name

    if storage.fruit.corehubs[force_name] and storage.fruit.corehubs[force_name][surface_name] then
        storage.fruit.corehubs[force_name][surface_name] = nil
        debug_log("Corehub removed! Force: " .. force_name .. ", Surface: " .. surface_name .. ", ID: " .. entity.unit_number)
    end
end

local function add_command_center_view(entity, frame, player)
    local scroll = frame.add { type = "scroll-pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto" }
    scroll.style.maximal_width = 600
    scroll.style.maximal_height = 600

    local overview = scroll.add { type = "flow", direction = "vertical" }

    overview.add { type = "label", caption = { "fruit.overview" } }

    local des = overview.add { type = "label", caption = { "fruit.hub-description" } }
    des.style.rich_text_setting = defines.rich_text_setting.highlight
    des.style.maximal_width = 320
    des.style.single_line = false

    overview.add { type = "line" }

    local table = overview.add { type = "table", column_count = 2, draw_horizontal_lines = true }

    -- todo add 已用 可用， 简介
end

local function on_gui_opened(event)
    if (event.entity or {}).name == ENTITY_NAME then
        local player = game.players[event.player_index]
        if not player then
            return
        end

        --local unit_number = event.entity.unit_number

        local guiKey = "food-command-center"
        local food_gui = player.gui.relative[guiKey]
        if food_gui then
            food_gui.destroy()
        end

        local anchor = {
            gui = defines.relative_gui_type.container_gui,
            name = "food-command-center",
            position = defines.relative_gui_position.right
        }
        food_gui = player.gui.relative.add {
            type = "frame",
            anchor = anchor,
            caption = { "entity-name.food-command-center" },
            direction = "vertical",
            name = guiKey
        }

        add_command_center_view(entity, food_gui, player)

    end

end

local function on_built(event)
    local entity = event.entity
    if not entity or not entity.valid or entity.name ~= ENTITY_NAME then
        return
    end

    local surface = entity.surface
    local force = entity.force

    local player = event.player_index and game.get_player(event.player_index)

    local built_count = surface.count_entities_filtered({ name = ENTITY_NAME, force = force })

    if built_count > 1 then
        -- 将物品返还给玩家
        if player and player.get_main_inventory() and player.get_main_inventory().can_insert({ name = ENTITY_NAME, count = 1 }) then
            player.insert({ name = ENTITY_NAME, count = 1 })

            player.create_local_flying_text { position = entity.position, text = { "fruit.core_hub_limit_reached" } }
        else

            surface.spill_item_stack { position = entity.position, stack = { name = ENTITY_NAME, count = 1 } }

            for k, p in pairs(game.players) do
                p.create_local_flying_text { position = entity.position, text = { "", { "fruit.core_hub_limit_reached" }, { "fruit.restaurant_drop" } } }
            end
        end

        -- 阻止建造并给予提示
        entity.destroy()
        return
    end

    on_built_corehub(entity)
end

MyEvent.on_event(defines.events.on_gui_opened, on_gui_opened)

local filter = { { filter = "name", name = ENTITY_NAME } }

MyEvent.on_init(on_init)
MyEvent.on_configuration_changed(on_init)

---- ON EVENT ----
-- 监听机器人建造实体和玩家建造实体的事件
MyEvent.on_event(defines.events.on_robot_built_entity, on_built, filter)
MyEvent.on_event(defines.events.on_built_entity, on_built, filter)
MyEvent.on_event(defines.events.script_raised_revive, on_built, filter)
MyEvent.on_event(defines.events.script_raised_built, on_built, filter)
MyEvent.on_event(defines.events.on_space_platform_built_entity, on_built, filter)

-- 监听实体死亡、机器人预挖掘和玩家预挖掘的事件
MyEvent.on_event(defines.events.on_entity_died, on_entity_died, filter)
MyEvent.on_event(defines.events.script_raised_destroy, on_entity_died, filter)
MyEvent.on_event(defines.events.on_robot_pre_mined, on_entity_died, filter)
MyEvent.on_event(defines.events.on_space_platform_mined_entity, on_entity_died, filter)
MyEvent.on_event(defines.events.on_pre_player_mined_item, on_entity_died, filter)


---- 每秒钟检查所有 corehub 的内容
--script.on_nth_tick(60, function()
--    for force_name, surfaces in pairs(storage.fruit.corehubs) do
--        for surface_name, unit_number in pairs(surfaces) do
--            local count = get_count_can_build(unit_number)
--            debug_log("Corehub [Force: " .. force_name .. ", Surface: " .. surface_name .. ", Can build: " .. count .. "] .")
--
--        end
--    end
--end)
