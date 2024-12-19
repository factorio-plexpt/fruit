local entity_name = "restaurant"

-- 餐厅


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
                player. create_local_flying_text { position = entity.position, text = { "fruit.restaurant_limit_reached" } }

            else
                surface.spill_item_stack { position = entity.position, stack = { name = entity_name, count = 1 } }
                for k, v in pairs(game.players) do
                    v.create_local_flying_text { position = entity.position, text = { "", { "fruit.restaurant_limit_reached" }, { "fruit.restaurant_drop" } } }
                end
            end

            -- 阻止建造并给予提示
            entity.destroy()
            return
        end

        entity.recipe_locked = true

        -- 生成 1 到 1000 的随机整数
        local random_number = math.random(1, 1000)

        entity.set_recipe("fruit-order-" .. random_number)

        --storage.fruit.restaurant[force.name] = storage.fruit.restaurant[force.name] or {}
        --storage.fruit.restaurant[force.name][surface.name] = storage.fruit.restaurant[force.name][surface.name] or {}
        table.insert(storage.fruit.restaurant, entity.unit_number)
        --entity.set_recipe("fruit-order-3")



    end
end

local function on_entity_died(event)
    local entity = event.entity
    if not entity or not entity.valid then
        return
    end

    --table.insert(storage.fruit.restaurant, entity.unit_number)

    -- 清理无效的 unit_number
    for i = #storage.fruit.restaurant, 1, -1 do
        local unit_number = storage.fruit.restaurant[i]
        local entity = entity.unit_number
        if unit_number == entity.unit_number then
            table.remove(storage.fruit.restaurant, i)
        end
    end

end

local filter = { { filter = "name", name = entity_name } }

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

script.on_nth_tick(600, function()

    for i, unit_number in pairs(storage.fruit.restaurant) do
        -- 在这里处理每个 unit_number
        local entity = game.get_entity_by_unit_number(unit_number)
        if entity and entity.valid then
            -- 检查实体是否存在且有效
            -- 对 entity 进行操作，
            entity.recipe_locked = true

            -- 生成 1 到 1000 的随机整数
            local random_number = math.random(1, 1000)

            entity.set_recipe("fruit-order-" .. random_number)

        end
    end

end)
