-- https://github.com/ClaudeMetz/UntitledGuiGuide/wiki/Topic:-Modifying-Vanilla-GUIs


local function add_command_center_view(entity, frame, player)
    local scroll = frame.add { type = "scroll-pane", horizontal_scroll_policy = "never", vertical_scroll_policy = "auto" }
    scroll.style.maximal_width = 600
    scroll.style.maximal_height = 600

    local overview = scroll.add { type = "flow", direction = "vertical" }

    overview.add { type = "label", caption = { "fruit.overview" } }

    local des = overview.add { type = "label", caption = { "fruit.hub-description" } }
    des.style.rich_text_setting = defines.rich_text_setting.highlight
    des.style.maximal_width = 320

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

MyEvent.on_event(defines.events.on_gui_opened, on_gui_opened)
