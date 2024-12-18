local entity_name = "restaurant"

-- 餐厅
---- INIT ----
-- 初始化事件，当游戏加载或重置时调用
local function on_init()
    storage.fruit = storage.fruit or {}
    -- 初始化存储表，用于存储实体和电源实体
    storage.fruit.entities = storage.fruit.entities or {}
    storage.fruit.restaurant = storage.fruit.restaurant or {} -- 使用复数形式以区分两个生成器
    storage.fruit.unit = storage.fruit.unit or {} -- 使用复数形式以区分两个生成器
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
                player. create_local_flying_text { position = entity.position, text = { "fruit.restaurant_limit_reached" } }

            else
                surface.spill_item_stack(entity.position, { name = "restaurant", count = 1 })
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
        --entity.set_recipe("fruit-order-3")

        -- 获取实体位置
        --local pos = entity.position.x .. " " .. entity.position.y
        --local generator_pos = {
        --    x = entity.position.x - 1.5,
        --    y = entity.position.y,
        --}
        --local generator_pos2 = {
        --    x = entity.position.x + 1.5,
        --    y = entity.position.y,
        --}
        --
        ---- 在相同位置创建第一个电源实体
        --local generator1 = entity.surface.create_entity {
        --    name = "ion-thruster-xenon-generator",
        --    position = generator_pos,
        --    force = entity.force, -- 电源实体所属势力
        --    direction = entity.direction, -- 电源实体方向
        --    destructible = false -- 电源实体不可破坏
        --}
        --storage.fruit.restaurant[pos .. "_1"] = generator1
        --
        ---- 在相同位置创建第二个电源实体
        --local generator2 = entity.surface.create_entity {
        --    name = "ion-thruster-xenon-generator",
        --    position = generator_pos2,
        --    force = entity.force, -- 电源实体所属势力
        --    direction = defines.direction.north, -- 电源实体方向
        --    destructible = false -- 电源实体不可破坏
        --}
        --storage.fruit.restaurant[pos .. "_2"] = generator2
        --
        ---- 存储实体
        --storage.fruit.entities[pos] = entity
        --
        --if entity.unit_number then
        --    storage.fruit.unit[entity.unit_number] = {
        --        entity = entity.unit_number,
        --        generator1 = generator1.unit_number,
        --        generator2 = generator2.unit_number,
        --    }
        --end

    end
end

local function on_entity_died(event)
    local entity = event.entity
    if not entity then
        return
    end

    ---- 获取实体位置
    --local pos = entity.position.x .. " " .. entity.position.y
    --
    ---- 如果该位置有存储的实体
    --if storage.fruit.entities[pos] ~= nil then
    --    -- 销毁第一个电源实体
    --    if storage.fruit.restaurant[pos .. "_1"] then
    --        storage.fruit.restaurant[pos .. "_1"].destroy()
    --        storage.fruit.restaurant[pos .. "_1"] = nil
    --    end
    --
    --    -- 销毁第二个电源实体
    --    if storage.fruit.restaurant[pos .. "_2"] then
    --        storage.fruit.restaurant[pos .. "_2"].destroy()
    --        storage.fruit.restaurant[pos .. "_2"] = nil
    --    end
    --
    --    -- 清空存储表中的实体
    --    storage.fruit.entities[pos] = nil
    --
    --    if entity.unit_number then
    --        storage.fruit.unit[entity.unit_number] = nil
    --    end
    --end
end

local function on_script_trigger_effect (event)
    if event.effect_id ~= "order_finish_restaurant" then
        return
    end

    log("==========完成订单==========")
    log(serpent.block(event))
    --      cause_entity = "[LuaEntity: character at [gps=5.7,14.7]]",
    --  effect_id = "order_finish_restaurant",
    --  name = 165,
    --  source_entity = "[LuaEntity: character at [gps=5.7,14.7]]",
    --  source_position = {
    --    x = 5.6875,
    --    y = 14.6875
    --  },
    --  surface_index = 1,
    --  target_entity = "[LuaEntity: character at [gps=5.7,14.7]]",
    --  target_position = {
    --    x = 5.6875,
    --    y = 14.6875
    --  },
    --  tick = 17427
    --}
end

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

script.on_nth_tick(600, function()

    for unit_number, data in pairs(storage.fruit.unit) do
        local entity = game.get_entity_by_unit_number(unit_number)
        local generator1 = game.get_entity_by_unit_number(data.generator1)
        local generator2 = game.get_entity_by_unit_number(data.generator2)
        if not (entity and entity.valid) then
            if generator1 and generator1.valid then
                generator1.destroy()
                storage.fruit.unit[unit_number] = nil
            end
            if generator2 and generator2.valid then
                generator2.destroy()
                storage.fruit.unit[unit_number] = nil
            end
        end
    end
end)
