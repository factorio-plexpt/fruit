local tree01 = data.raw.tree["tree-01"]
local mining_trigger = tree01.minable.mining_trigger

second = 60
minute = 60 * second
hour = 60 * minute
local fruit_index = 1
local function make_tree(name, count, size)
    local variations = {}

    -- 插入元素，包含数字
    for i = 1, count do
        variations[#variations + 1] = {
            trunk = {
                filename = "__fruit__/graphics/tree/" .. name .. i .. ".png",
                height = 512,
                width = 512,
                scale = 0.5,
                shift = { 0, -1 },
                frame_count = 1,
                repeat_count = 2,
            },
            leaves = {
                filename = "__fruit__/graphics/tree/" .. name .. i .. ".png",
                height = 512,
                width = 512,
                scale = 0.5,
                shift = { 0, -1 },
                frame_count = 1,
            },
            branch_generation = tree01.variations[1].branch_generation,
            leaf_generation = tree01.variations[1].leaf_generation,
        }
    end
    --  第一个元素，不包含数字
    variations[1].trunk.filename = "__fruit__/graphics/tree/" .. name .. ".png"
    variations[1].leaves.filename = "__fruit__/graphics/tree/" .. name .. ".png"

    data:extend {
        {
            type = "plant",
            --type = has_dlc and "plant" or "tree",
            name = name,
            icon = "__fruit__/graphics/tree/" .. name .. ".png",
            icon_size = 512,
            flags = { "placeable-neutral", "placeable-off-grid", "breaths-air" },
            minable = {
                results = { { type = "item", name = name, amount = 50 } },
                mining_particle = "wooden-particle",
                mining_time = 0.5,
                mining_trigger = mining_trigger
            },
            mined_sound = tree01.mined_sound,
            growth_ticks =  5 * minute,  -- has_dlc and 5 * minute or nil,
            harvest_emissions = mods["space-age"] and { spores = 15 } or nil,
            emissions_per_second = { pollution = -0.001 },
            max_health = 50,
            collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            drawing_box_vertical_extension = 0.8,
            subgroup = "fruit_tree",
            order = name,
            impact_category = "tree",
            agricultural_tower_tint = { primary = fruit_const.fruit[name], secondary = fruit_const.fruit[name] },
            --agricultural_tower_tint = {
            --    primary = { r = 0.552, g = 0.218, b = 0.218, a = 1.000 }, -- #8c3737ff
            --    secondary = { r = 0.561, g = 0.613, b = 0.308, a = 1.000 }, -- #8f4f4eff
            --},
            --factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
            colors = {
                { r = 255, g = 255, b = 255 },
                { r = 220, g = 255, b = 255 },
                { r = 255, g = 220, b = 255 },
                { r = 255, g = 255, b = 220 },
                { r = 220, g = 220, b = 255 },
                { r = 255, g = 220, b = 220 },
                { r = 220, g = 255, b = 220 },
            },

            -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
            map_color = { r = 0.15686, g = 0.58824, b = 0.34510 },
            variations = variations,
            autoplace = {
                probability_expression = "clamp(random_penalty_at(4, 1), 0, 1)",
                control = "trees",
                order = "a[tree]-b[forest]-a",
                probability_expression = "tree_0" .. ((fruit_index - 1) % 9 + 1),
            },
        },

    }

    log("add plant_result for " .. name)
    data.raw.item[name].plant_result = name
    data.raw.item[name].place_result = name

    fruit_index = fruit_index + 1
end

local fruits = {
    apple = 2,
    apricot = 1,
    avocado = 3,
    banana = 1,
    bayberry = 3,
    blackberry = 3,
    blueberry = 3,
    cantaloupe = 2,
    cherry = 2,
    coconut = 2,
    cranberry = 2,
    dragon_fruit = 2,
    durian = 3,
    fig = 2,
    grape = 3,
    kiwi = 2,
    lemon = 3,
    lychee = 3,
    mango = 2,
    mangosteen = 3,
    olive = 3,
    orange = 1,
    papaya = 1,
    peach = 2,
    pear = 2,
    pineapple = 3,
    plum = 2,
    pomegranate = 1,
    raspberry = 2,
    strawberry = 3,
    watermelon = 2,

    bell_pepper = 1,
    broccoli = 1,
    cabbage = 1,
    carrot = 1,
    chili = 1,
    cocoa_beans = 1,
    coffee_beans = 1,
    eggplant = 1,
    garlic = 1,
    lettuce = 1,
    onion = 1,
    pea = 1,
    potato = 1,
    pumpkin = 1,
    sugarcane = 1,
    sweet_potato = 1,
    tomato = 1,
    zucchini = 1,
}

for name, count in pairs(fruits) do
    make_tree(name, count)
end

local a2 = {
    autoplace = {
        control = "gleba_plants",
        order = "a[tree]-b[forest]-a",
        probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
        richness_expression = "random_penalty_at(3, 1)",
        tile_restriction = {
            "natural-yumako-soil",
            "artificial-yumako-soil",
            "overgrowth-yumako-soil"
        }
    },
    drawing_box_vertical_extension = 0.8,
    mined_sound = {
        {
            filename = "__space-age__/sound/mining/mined-yumako-tree-1.ogg",
            volume = 0.3
        },
        {
            filename = "__space-age__/sound/mining/mined-yumako-tree-2.ogg",
            volume = 0.3
        },
        {
            filename = "__space-age__/sound/mining/mined-yumako-tree-3.ogg",
            volume = 0.3
        },
        {
            filename = "__space-age__/sound/mining/mined-yumako-tree-4.ogg",
            volume = 0.3
        },
        {
            filename = "__space-age__/sound/mining/mined-yumako-tree-5.ogg",
            volume = 0.3
        },
        {
            filename = "__space-age__/sound/mining/mined-yumako-tree-6.ogg",
            volume = 0.3
        }
    },
    mining_sound = {
        {
            filename = "__space-age__/sound/mining/axe-mining-yumako-tree-1.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/mining/axe-mining-yumako-tree-2.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/mining/axe-mining-yumako-tree-3.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/mining/axe-mining-yumako-tree-4.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/mining/axe-mining-yumako-tree-5.ogg",
            volume = 0.6
        }
    },
    name = "yumako-tree",
    type = "plant",
    variations = {
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = {
                    1.625,
                    -1.25
                },
                width = 640,
                x = 0,
                y = 0
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 0
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 0
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 0
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 0
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 0
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 0
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 0
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 0
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 0
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 0
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 0
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 0
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 0
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 0
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 0
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 560
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 560
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 560
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 0,
                y = 560
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 560
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 560
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 560
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 640,
                y = 560
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 560
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 560
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 560
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1280,
                y = 560
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 560
            },
            normal = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-normal.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 560
            },
            shadow = {
                filenames = {
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-harvest-shadow.png",
                    "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-shadow.png"
                },
                frame_count = 2,
                height = 560,
                line_length = 1,
                lines_per_file = 1,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 560
            },
            trunk = {
                filename = "__space-age__/graphics/entity/plant/yumako-tree/yumako-tree-trunk.png",
                frame_count = 1,
                height = 560,
                scale = 0.42900000000000009,
                shift = "SERPENT PLACEHOLDER",
                width = 640,
                x = 1920,
                y = 560
            }
        }
    }
}

local tree1 = {

    autoplace = {
        control = "trees",
        order = "a[tree]-b[forest]-a[wet]-c[cold]",
        probability_expression = "tree_01",
        richness_expression = "clamp(random_penalty_at(6, 1), 0, 1)"
    },
    collision_box = {
        {
            -0.4,
            -0.4
        },
        {
            0.4,
            0.4
        }
    },
    colors = {
        {
            b = 224,
            g = 255,
            r = 156
        },
        {
            b = 152,
            g = 243,
            r = 118
        },
        {
            b = 227,
            g = 215,
            r = 116
        },
        {
            b = 80,
            g = 209,
            r = 221
        },
        {
            b = 90,
            g = 242,
            r = 131
        },
        {
            b = 138,
            g = 185,
            r = 83
        },
        {
            b = 74,
            g = 224,
            r = 71
        },
        {
            b = 41,
            g = 242,
            r = 230
        }
    },
    corpse = "tree-01-stump",
    damaged_trigger_effect = {
        {
            damage_type_filters = "fire",
            sound = {
                {
                    filename = "__base__/sound/particles/tree-leaves-1.ogg",
                    volume = 0.35
                },
                {
                    filename = "__base__/sound/particles/tree-leaves-2.ogg",
                    volume = 0.35
                },
                {
                    filename = "__base__/sound/particles/tree-leaves-3.ogg",
                    volume = 0.35
                },
                {
                    filename = "__base__/sound/particles/tree-leaves-4.ogg",
                    volume = 0.35
                },
                {
                    filename = "__base__/sound/particles/tree-leaves-5.ogg",
                    volume = 0.35
                }
            },
            type = "play-sound"
        }
    },
    darkness_of_burnt_tree = 0.5,
    drawing_box_vertical_extension = 1.8,
    emissions_per_second = {
        pollution = -0.001
    },
    factoriopedia_simulation = {
        hide_factoriopedia_gradient = true,
        init = "    game.simulation.camera_zoom = 1.4\n    game.simulation.camera_position = {-0.5, 0}\n    for x = -10, 9, 1 do\n      for y = -4, 4 do\n        game.surfaces[1].set_tiles{{position = {x, y}, name = \"grass-1\"}}\n      end\n    end\n\n    game.surfaces[1].create_entity{name = \"tree-01\", position = {-5.5, 2}}\n    game.surfaces[1].create_entity{name = \"tree-09-brown\", position = {-4, 0}}\n    game.surfaces[1].create_entity{name = \"tree-02\", position = {-2.5, 1}}\n    game.surfaces[1].create_entity{name = \"tree-03\", position = {-3, 2.5}}\n    game.surfaces[1].create_entity{name = \"tree-04\", position = {0, 0.5}}\n    game.surfaces[1].create_entity{name = \"tree-05\", position = {-0.5, 3}}\n    game.surfaces[1].create_entity{name = \"tree-09\", position = {2.5, 1}}\n    game.surfaces[1].create_entity{name = \"tree-02-red\", position = {2, 3}}\n    game.surfaces[1].create_entity{name = \"tree-02\", position = {4.5, 0.5}}\n    game.surfaces[1].create_entity{name = \"tree-07\", position = {4.5, 2.5}}\n  "
    },
    flags = {
        "placeable-neutral",
        "placeable-off-grid",
        "breaths-air"
    },
    icon = "__base__/graphics/icons/tree-01.png",
    impact_category = "tree",
    localised_name = {
        "entity-name.tree"
    },
    map_generator_bounding_box = {
        {
            -0.8,
            -0.8
        },
        {
            0.8,
            0.8
        }
    },
    max_health = 50,

    mined_sound = {
        {
            filename = "__base__/sound/particles/tree-mined-1.ogg",
            volume = 0.4
        },
        {
            filename = "__base__/sound/particles/tree-mined-2.ogg",
            volume = 0.4
        },
        {
            filename = "__base__/sound/particles/tree-mined-3.ogg",
            volume = 0.4
        },
        {
            filename = "__base__/sound/particles/tree-mined-4.ogg",
            volume = 0.4
        },
        {
            filename = "__base__/sound/particles/tree-mined-5.ogg",
            volume = 0.4
        }
    },
    name = "tree-01",
    order = "a[tree]-a[nauvis]-a[regular]-a[tree-01]",
    remains_when_mined = "tree-01-stump",
    selection_box = {
        {
            -0.9,
            -2.2000000000000002
        },
        {
            0.9,
            0.6
        }
    },
    subgroup = "trees",
    type = "tree",
    variation_weights = {
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0.3,
        0.3,
        0.05,
        0.05
    },
    variations = {
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-a-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 306,
                scale = 0.5,
                shift = {
                    -0.03125,
                    -2.3125
                },
                width = 184
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-a-normal.png",
                frame_count = 3,
                height = 290,
                scale = 0.5,
                shift = {
                    -0.015625,
                    -2.375
                },
                width = 184
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-a-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 134,
                scale = 0.5,
                shift = {
                    1.90625,
                    -0.0625
                },
                width = 324
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-a-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 340,
                scale = 0.5,
                shift = {
                    0.0625,
                    -2.15625
                },
                width = 140
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 0
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-b-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 316,
                scale = 0.5,
                shift = {
                    0.03125,
                    -2.25
                },
                width = 182
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-b-normal.png",
                frame_count = 3,
                height = 300,
                scale = 0.5,
                shift = {
                    0.0625,
                    -2.34375
                },
                width = 180
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-b-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 126,
                scale = 0.5,
                shift = {
                    2,
                    0
                },
                width = 312
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-b-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 326,
                scale = 0.5,
                shift = {
                    0.125,
                    -2.0625
                },
                width = 132
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 40
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-c-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 308,
                scale = 0.5,
                shift = {
                    0,
                    -2.25
                },
                width = 180
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-c-normal.png",
                frame_count = 3,
                height = 306,
                scale = 0.5,
                shift = {
                    0.015625,
                    -2.1875
                },
                width = 182
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-c-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 132,
                scale = 0.5,
                shift = {
                    1.84375,
                    0
                },
                width = 306
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-c-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 330,
                scale = 0.5,
                shift = {
                    -0.125,
                    -2.125
                },
                width = 136
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 80
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-d-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 310,
                scale = 0.5,
                shift = {
                    0.03125,
                    -2.25
                },
                width = 188
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-d-normal.png",
                frame_count = 3,
                height = 286,
                scale = 0.5,
                shift = {
                    0.0625,
                    -2.359375
                },
                width = 188
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-d-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 130,
                scale = 0.5,
                shift = {
                    1.84375,
                    -0.09375
                },
                width = 288
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-d-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 324,
                scale = 0.5,
                shift = {
                    0.0625,
                    -2.09375
                },
                width = 108
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 120
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-e-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 300,
                scale = 0.5,
                shift = {
                    0.09375,
                    -2.21875
                },
                width = 190
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-e-normal.png",
                frame_count = 3,
                height = 280,
                scale = 0.5,
                shift = {
                    0.125,
                    -2.125
                },
                width = 190
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-e-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 136,
                scale = 0.5,
                shift = {
                    2.09375,
                    0.03125
                },
                width = 314
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-e-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 324,
                scale = 0.5,
                shift = {
                    0.0625,
                    -2.0625
                },
                width = 138
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 160
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-f-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 304,
                scale = 0.5,
                shift = {
                    -0.09375,
                    -2.09375
                },
                width = 190
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-f-normal.png",
                frame_count = 3,
                height = 278,
                scale = 0.5,
                shift = {
                    -0.0625,
                    -2.21875
                },
                width = 190
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-f-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 140,
                scale = 0.5,
                shift = {
                    1.75,
                    0.03125
                },
                width = 304
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-f-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 326,
                scale = 0.5,
                shift = {
                    -0.125,
                    -2.03125
                },
                width = 118
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 200
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-g-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 274,
                scale = 0.5,
                shift = {
                    -0.09375,
                    -1.90625
                },
                width = 184
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-g-normal.png",
                frame_count = 3,
                height = 248,
                scale = 0.5,
                shift = {
                    -0.078125,
                    -1.9375
                },
                width = 186
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-g-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 130,
                scale = 0.5,
                shift = {
                    1.28125,
                    -0.0625
                },
                width = 252
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-g-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 294,
                scale = 0.5,
                shift = {
                    -0.0625,
                    -1.84375
                },
                width = 142
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 240
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-h-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 282,
                scale = 0.5,
                shift = {
                    0.03125,
                    -1.96875
                },
                width = 180
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-h-normal.png",
                frame_count = 3,
                height = 244,
                scale = 0.5,
                shift = {
                    0.046875,
                    -1.90625
                },
                width = 180
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-h-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 130,
                scale = 0.5,
                shift = {
                    1.71875,
                    -0.09375
                },
                width = 266
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-h-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 296,
                scale = 0.5,
                shift = {
                    0.125,
                    -1.875
                },
                width = 116
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 280
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-i-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 234,
                scale = 0.5,
                shift = {
                    -0.0625,
                    -1.625
                },
                width = 152
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-i-normal.png",
                frame_count = 3,
                height = 196,
                scale = 0.5,
                shift = {
                    -0.046875,
                    -1.765625
                },
                width = 152
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-i-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 118,
                scale = 0.5,
                shift = {
                    1.5625,
                    0.09375
                },
                width = 228
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-i-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 244,
                scale = 0.5,
                shift = {
                    0,
                    -1.53125
                },
                width = 120
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 320
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-j-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 228,
                scale = 0.5,
                shift = {
                    0,
                    -1.59375
                },
                width = 134
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-j-normal.png",
                frame_count = 3,
                height = 194,
                scale = 0.5,
                shift = {
                    0.046875,
                    -1.828125
                },
                width = 134
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-j-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 104,
                scale = 0.5,
                shift = {
                    1.5625,
                    -0.09375
                },
                width = 212
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-j-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 250,
                scale = 0.5,
                shift = {
                    0,
                    -1.5625
                },
                width = 110
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 360
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-k-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 206,
                scale = 0.5,
                shift = {
                    0.3125,
                    -0.375
                },
                width = 250
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-k-normal.png",
                frame_count = 3,
                height = 150,
                scale = 0.5,
                shift = {
                    0.8125,
                    -0.8125
                },
                width = 186
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-k-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 212,
                scale = 0.5,
                shift = {
                    0.40625,
                    -0.40625
                },
                width = 256
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-k-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 224,
                scale = 0.5,
                shift = {
                    0.3125,
                    -0.40625
                },
                width = 258
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 400
                },
                rotate = false
            }
        },
        {
            branch_generation = {
                frame_speed = 0.4,
                initial_height = 2,
                initial_height_deviation = 2,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "branch-particle",
                repeat_count = 15,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaf_generation = {
                initial_height = 2,
                initial_height_deviation = 0.05,
                initial_vertical_speed = 0.01,
                offset_deviation = {
                    {
                        -0.5,
                        -0.5
                    },
                    {
                        0.5,
                        0.5
                    }
                },
                particle_name = "leaf-particle",
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.01,
                type = "create-particle"
            },
            leaves = {
                filename = "__base__/graphics/entity/tree/01/tree-01-l-leaves.png",
                flags = {
                    "mipmap"
                },
                frame_count = 3,
                height = 114,
                scale = 0.5,
                shift = {
                    -0.96875,
                    0
                },
                width = 354
            },
            normal = {
                filename = "__base__/graphics/entity/tree/01/tree-01-l-normal.png",
                frame_count = 3,
                height = 112,
                scale = 0.5,
                shift = {
                    -1.640625,
                    0.03125
                },
                width = 240
            },
            shadow = {
                disable_shadow_distortion_beginning_at_frame = 2,
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/tree/01/tree-01-l-shadow.png",
                flags = {
                    "mipmap",
                    "shadow"
                },
                frame_count = 4,
                height = 94,
                scale = 0.5,
                shift = {
                    -0.90625,
                    0.15625
                },
                width = 366
            },
            trunk = {
                filename = "__base__/graphics/entity/tree/01/tree-01-l-trunk.png",
                flags = {
                    "mipmap"
                },
                frame_count = 1,
                height = 116,
                scale = 0.5,
                shift = {
                    1,
                    0.21875
                },
                width = 620
            },
            water_reflection = {
                orientation_to_variation = false,
                pictures = {
                    filename = "__base__/graphics/entity/tree/01/tree-01-reflection.png",
                    height = 40,
                    priority = "extra-high",
                    scale = 5,
                    shift = {
                        0,
                        2.1875
                    },
                    variation_count = 4,
                    width = 28,
                    y = 440
                },
                rotate = false
            }
        }
    }
}
