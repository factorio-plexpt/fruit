local animal_eggs = {
    cow = "cow-egg",
    chicken = "egg",
    sheep = "sheep-egg",
    psyduck = "duck_egg",
}

local function egg_laying ()

    for k, surface in pairs(game.surfaces) do

        if surface.name and (string.find(surface.name, "^platform-") or string.find(surface.name, "^minime")) then

            --    skip
        else
            -- Find units
            --local units = surface.find_units({ area = { { -2000, -2000 }, { 2000, 2000 } }, force = "neutral", condition = "all" })
            local units = surface.find_entities_filtered({ type = "unit", force = { "neutral", "player" } })

            for k, unit in pairs(units) do

                if unit.name and animal_eggs[unit.name] then

                    -- 随机生成一个 1 或 2 的数字
                    local choice = math.random(1, 3)
                    if choice == 1 then
                        surface.spill_item_stack { position = unit.position, stack = { name = animal_eggs[unit.name], count = 1 } }
                    else
                        surface.spill_item_stack { position = unit.position, stack = { name = "poop", count = 1 } }
                    end

                end
            end
        end
    end
end

script.on_nth_tick(6003, egg_laying)
