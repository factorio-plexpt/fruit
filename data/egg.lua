local function get_trigger(entity_name)

    return {
        items_per_trigger = 1,
        trigger = {
            type = "direct",
            action_delivery = {
                type = "instant",
                source_effects = {
                    {
                        type = "create-entity",
                        entity_name = entity_name,
                        affects_target = true,
                        show_in_tooltip = true,
                        as_enemy = false,
                        find_non_colliding_position = true,
                        trigger_created_entity = true,
                        check_buildability = false,
                        offset_deviation = { { -5, -5 }, { 5, 5 } },
                        non_colliding_fail_result = {
                            type = "direct",
                            action_delivery = {
                                type = "instant",
                                source_effects = {
                                    {
                                        type = "create-entity",
                                        entity_name = entity_name,
                                        affects_target = true,
                                        show_in_tooltip = false,
                                        as_enemy = false,
                                        trigger_created_entity = true,
                                        check_buildability = false,
                                        offset_deviation = { { -5, -5 }, { 5, 5 } },
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
end

local hatched_eggs = {
    --chicken = "hatched-egg-chicken",
    chicken = "egg",
    psyduck = "duck_egg",
    cow = "cow-egg",
    sheep = "sheep-egg",

}

for entity_name, egg in pairs(hatched_eggs) do

    ITEM {
        type = "item",
        name = "hatched-egg-" .. entity_name,
        localised_name = { "recipe-name.fruit-hatching", " ", { "item-name." .. egg } },
        icon = "__fruit__/graphics/icon/" .. egg .. ".png",
        icon_size = 512,
        subgroup = "egg",
        order = egg,
        stack_size = 10,
        spoil_ticks = 30 * 60 + 1,
        spoil_to_trigger_result = get_trigger(entity_name),
    }

    RECIPE {
        type = "recipe",
        name = "incubate-egg-" .. entity_name,
        localised_name = { "recipe-name.fruit-hatching", " ", { "item-name." .. egg } },
        enabled = false,
        ingredients = {
            { type = "item", name = egg, amount = 1 },
        },
        results = {
            { type = "item", name = "hatched-egg-" .. entity_name, amount = 1 },
        },
        result_is_always_fresh = true,
        energy_required = 30, -- 孵化所需的时间
        category = "incubator"  -- 使用的机器类别
    }:add_unlock("food-processing")


end
