-- https://github.com/ClaudeMetz/UntitledGuiGuide/wiki/Topic:-Modifying-Vanilla-GUIs
local entity_name = "food-command-center"

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
    if (event.entity or {}).name == "food-command-center" then
        local player = game.players[event.player_index]
        if not player then
            return
        end

        local unit_number = event.entity.unit_number

        --local city = Util.findCityByTownHallUnitNumber(unit_number)
        --assert(city ~= nil, "Could not find the city for town hall unit number " .. unit_number)

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

        add_command_center_view(city, food_gui, player)

    end

end

local function on_built(event)
    local entity = event.entity
    if not entity or not entity.valid then
        return
    end


    -- 检查实体类型
    if entity.name == entity_name then
        local surface = entity.surface
        local force = entity.force

        local player = event.player_index and game.get_player(event.player_index)

        local restaurant_count = surface.count_entities_filtered({
            name = entity_name,
            force = force
        })

        if restaurant_count > 1 then
            -- 将物品返还给玩家

            if player and player.get_main_inventory() and player.get_main_inventory().can_insert({ name = entity_name, count = 1 }) then
                player.insert({ name = entity_name, count = 1 })

                player. create_local_flying_text { position = entity.position, text = { "fruit.core_hub_limit_reached" } }
            else
                surface.spill_item_stack(entity.position, { name = "restaurant", count = 1 })
                for k, v in pairs(game.players) do
                    v.create_local_flying_text { position = entity.position, text = { "", { "fruit.core_hub_limit_reached" }, { "fruit.restaurant_drop" } } }
                end
            end

            -- 阻止建造并给予提示
            entity.destroy()
            return
        end


    end
end

MyEvent.on_event(defines.events.on_gui_opened, on_gui_opened)

local filter = { { filter = "name", name = entity_name } }

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

MyEvent.on_event(defines.events.on_script_trigger_effect, on_script_trigger_effect)
