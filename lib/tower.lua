local tower = {
    arm_extending_sound = {
        sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg",
            volume = 0.25
        },
        stopped_sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg",
            volume = 0.6
        }
    },
    arm_extending_sound_source = "arm_central_joint",
    central_orienting_sound = {
        sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg",
            volume = 0.3
        },
        stopped_sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg",
            volume = 0.5
        }
    },
    central_orienting_sound_source = "hub",
    circuit_connector = {
        points = {
            shadow = {
                green = {
                    -0.40625,
                    0.71875
                },
                red = {
                    -0.15625,
                    0.71875
                }
            },
            wire = {
                green = {
                    -0.5,
                    0.65625
                },
                red = {
                    -0.46875,
                    0.4375
                }
            }
        },
        sprites = {
            blue_led_light_offset = {
                -0.21875,
                0.65625
            },
            connector_main = {
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png",
                height = 50,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.21875,
                    0.40625
                },
                width = 52,
                x = 312,
                y = 150
            },
            connector_shadow = {
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04b-base-shadow-sequence.png",
                height = 46,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.140625,
                    0.453125
                },
                width = 60,
                x = 360,
                y = 138
            },
            led_blue = {
                draw_as_glow = true,
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
                height = 60,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.21875,
                    0.375
                },
                width = 60,
                x = 360,
                y = 180
            },
            led_blue_off = {
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
                height = 44,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.21875,
                    0.375
                },
                width = 46,
                x = 276,
                y = 132
            },
            led_green = {
                draw_as_glow = true,
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
                height = 46,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.21875,
                    0.375
                },
                width = 48,
                x = 288,
                y = 138
            },
            led_light = {
                intensity = 0,
                size = 0.9
            },
            led_red = {
                draw_as_glow = true,
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
                height = 46,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.21875,
                    0.375
                },
                width = 48,
                x = 288,
                y = 138
            },
            red_green_led_light_offset = {
                -0.21875,
                0.5625
            },
            wire_pins = {
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png",
                height = 58,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.21875,
                    0.40625
                },
                width = 62,
                x = 372,
                y = 174
            },
            wire_pins_shadow = {
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04d-wire-shadow-sequence.png",
                height = 54,
                priority = "low",
                scale = 0.5,
                shift = {
                    -0.0625,
                    0.484375
                },
                width = 68,
                x = 408,
                y = 162
            }
        }
    },
    circuit_wire_max_distance = 30,
    close_sound = {
        filename = "__base__/sound/machine-close.ogg",
        volume = 0.5
    },
    collision_box = {
        {
            -1.2,
            -1.2
        },
        {
            1.2,
            1.2
        }
    },
    collision_mask = {
        layers = {
            elevated_rail = true,
            is_lower_object = true,
            is_object = true,
            item = true,
            object = true,
            player = true,
            water_tile = true
        }
    },
    corpse = "agricultural-tower-remnants",
    crane = {
        min_arm_extent = 0,
        min_grappler_extent = 0.2,
        operation_angle = 10,
        origin = {
            0.5,
            -0.55,
            4.5999999999999996
        },
        parts = {
            {
                allow_sprite_rotation = false,
                dying_effect = {
                    explosion = {
                        name = "explosion",
                        offset = {
                            0,
                            1
                        }
                    },
                    explosion_linear_distance_step = 0.4,
                    particle_effect_linear_distance_step = 0.15,
                    particle_effects = {
                        initial_height = 0,
                        initial_height_deviation = 0.2,
                        offset_deviation = {
                            {
                                -0.39450000000000003,
                                -0.49610000000000003
                            },
                            {
                                0.39450000000000003,
                                0.49610000000000003
                            }
                        },
                        particle_name = "accumulator-metal-particle-big",
                        repeat_count = 20,
                        speed_from_center = 0.02,
                        speed_from_center_deviation = 0.01,
                        type = "create-particle"
                    }
                },
                extendable_length = {
                    0,
                    0,
                    0
                },
                layer = 1,
                name = "hub",
                relative_position = {
                    0,
                    0,
                    0
                },
                rotated_sprite = {
                    dice = 4,
                    direction_count = 128,
                    filenames = {
                        "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-1.png",
                        "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-2.png"
                    },
                    height = 330,
                    line_length = 8,
                    lines_per_file = 8,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0,
                        -0.140625
                    },
                    width = 406
                },
                rotated_sprite_reflection = {
                    direction_count = 64,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-reflection.png",
                    height = 36,
                    line_length = 8,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0.015625
                    },
                    width = 44
                },
                rotated_sprite_shadow = {
                    direction_count = 64,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-shadow.png",
                    height = 204,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0.078125,
                        0
                    },
                    width = 168
                },
                should_scale_for_perspective = false,
                snap_end = 1,
                snap_start = 1,
                static_length = {
                    0,
                    0,
                    0.88000000000000007
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length = {
                    0,
                    0,
                    0
                },
                layer = -1,
                name = "arm_inner",
                relative_position = {
                    0,
                    0.45,
                    0
                },
                rotated_sprite = {
                    direction_count = 128,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-3.png",
                    height = 210,
                    line_length = 16,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0,
                        -0.265625
                    },
                    width = 82
                },
                rotated_sprite_reflection = {
                    direction_count = 8,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-3-reflection.png",
                    height = 28,
                    line_length = 8,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        -0.03125
                    },
                    width = 12
                },
                rotated_sprite_shadow = {
                    direction_count = 32,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-3-shadow.png",
                    height = 110,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0,
                        -0.15625
                    },
                    width = 44
                },
                should_scale_for_perspective = false,
                snap_end = 0.7,
                snap_start = 1,
                static_length = {
                    0,
                    1,
                    0.76179585000000003
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length = {
                    0,
                    0,
                    0
                },
                layer = 2,
                name = "arm_inner_joint",
                relative_position = {
                    0,
                    0.4,
                    0.40471834000000007
                },
                rotated_sprite = {
                    direction_count = 128,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-4.png",
                    height = 128,
                    line_length = 16,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0,
                        0.125
                    },
                    width = 100
                },
                rotated_sprite_reflection = {
                    direction_count = 8,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-4-reflection.png",
                    height = 18,
                    line_length = 8,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0.015625
                    },
                    width = 14
                },
                rotated_sprite_shadow = {
                    direction_count = 32,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-4-shadow.png",
                    height = 66,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0,
                        0.0625
                    },
                    width = 52
                },
                should_scale_for_perspective = false,
                snap_end = 0.5,
                snap_end_arm_extent_multiplier = 0.1,
                snap_start = 0.8,
                static_length = {
                    0,
                    1.6000000000000001,
                    0.19648000000000001
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length = {
                    0,
                    4.5,
                    0.55259999999999998
                },
                is_contractible_by_cropping = true,
                name = "arm_central",
                relative_position = {
                    0,
                    -1.5,
                    -0.18420000000000002
                },
                rotated_sprite = {
                    direction_count = 128,
                    filenames = {
                        "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5-1.png",
                        "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5-2.png"
                    },
                    height = 774,
                    line_length = 16,
                    lines_per_file = 4,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0,
                        0.46875
                    },
                    width = 66
                },
                rotated_sprite_reflection = {
                    direction_count = 8,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5-reflection.png",
                    height = 80,
                    line_length = 8,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0.046875
                    },
                    width = 10
                },
                rotated_sprite_shadow = {
                    direction_count = 32,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5-shadow.png",
                    height = 388,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0,
                        0.21875
                    },
                    width = 36
                },
                snap_end = 0.3,
                snap_start = 0.7,
                static_length = {
                    0,
                    1.3999999999999999,
                    0.17191999999999998
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length = {
                    0,
                    0,
                    0
                },
                layer = 1,
                name = "arm_central_joint",
                orientation_shift = 0,
                relative_position = {
                    0,
                    -0.2,
                    0.036839999999999993
                },
                rotated_sprite = {
                    direction_count = 128,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-6.png",
                    height = 144,
                    line_length = 16,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0,
                        -0.46875
                    },
                    width = 72
                },
                rotated_sprite_reflection = {
                    direction_count = 8,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-6-reflection.png",
                    height = 18,
                    line_length = 8,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        -0.046875
                    },
                    width = 10
                },
                rotated_sprite_shadow = {
                    direction_count = 32,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-6-shadow.png",
                    height = 74,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0,
                        -0.234375
                    },
                    width = 38
                },
                snap_end = 0.2,
                snap_end_arm_extent_multiplier = 0.05,
                snap_start = 0.3,
                static_length = {
                    0,
                    0.7,
                    -0.13607999999999998
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length = {
                    0,
                    4,
                    -0.77759999999999998
                },
                is_contractible_by_cropping = true,
                layer = 0,
                name = "arm_outer",
                relative_position = {
                    0,
                    -0.5,
                    0.097199999999999989
                },
                rotated_sprite = {
                    direction_count = 128,
                    filenames = {
                        "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7-1.png",
                        "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7-2.png"
                    },
                    height = 628,
                    line_length = 16,
                    lines_per_file = 4,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        -0.03125,
                        0.359375
                    },
                    width = 64
                },
                rotated_sprite_reflection = {
                    direction_count = 8,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7-reflection.png",
                    height = 78,
                    line_length = 8,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0.140625
                    },
                    width = 10
                },
                rotated_sprite_shadow = {
                    direction_count = 32,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7-shadow.png",
                    height = 316,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        -0.015625,
                        0.171875
                    },
                    width = 34
                },
                snap_end = 0,
                snap_start = 0.3,
                static_length = {
                    0,
                    1.9,
                    -0.36935999999999996
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                layer = -1,
                name = "grappler-hub",
                relative_position = {
                    0,
                    0,
                    -0.17000000000000002
                },
                rotated_sprite = {
                    direction_count = 64,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-8.png",
                    height = 78,
                    line_length = 16,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0,
                        0
                    },
                    width = 44
                },
                rotated_sprite_shadow = {
                    direction_count = 32,
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-8-shadow.png",
                    height = 40,
                    line_length = 8,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0,
                        0
                    },
                    width = 24
                },
                sprite_reflection = {
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-8-reflection.png",
                    height = 12,
                    line_length = 1,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0
                    },
                    width = 8
                },
                static_length_grappler = {
                    0,
                    0,
                    -0.6
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length_grappler = {
                    0,
                    0,
                    -4
                },
                layer = -2,
                name = "telescope",
                relative_position = {
                    0,
                    0,
                    0
                },
                scale_to_fit_model = true,
                sprite = {
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-9.png",
                    height = 148,
                    line_length = 1,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        0.015625,
                        0
                    },
                    width = 26
                },
                sprite_reflection = {
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-9-reflection.png",
                    height = 20,
                    line_length = 1,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0
                    },
                    width = 6
                },
                sprite_shadow = {
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-9-shadow.png",
                    height = 74,
                    line_length = 1,
                    priority = "very-low",
                    scale = 1,
                    shift = {
                        0.015625,
                        0
                    },
                    width = 14
                },
                static_length_grappler = {
                    0,
                    0,
                    -0.5
                }
            },
            {
                dying_effect = "SERPENT PLACEHOLDER",
                extendable_length_grappler = {
                    0,
                    0,
                    0
                },
                layer = -3,
                name = "grappler-claw",
                relative_position = {
                    0,
                    0,
                    0
                },
                should_scale_for_perspective = false,
                sprite = {
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-10.png",
                    height = 62,
                    line_length = 1,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        -0.015625,
                        0.015625
                    },
                    width = 42
                },
                sprite_reflection = {
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-10-reflection.png",
                    height = 12,
                    line_length = 1,
                    priority = "very-low",
                    scale = 5,
                    shift = {
                        0,
                        0.015625
                    },
                    width = 8
                },
                sprite_shadow = {
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-10.png",
                    height = 62,
                    line_length = 1,
                    priority = "very-low",
                    scale = 0.5,
                    shift = {
                        -0.015625,
                        0.015625
                    },
                    width = 42
                },
                static_length_grappler = {
                    0,
                    0,
                    -0.75
                }
            }
        },
        shadow_direction = {
            -0.59501999999999997,
            0.0091240000000000006,
            0.80365900000000003
        },
        speed = {
            arm = {
                extension_speed = 0.005,
                turn_rate = 0.002
            },
            grappler = {
                allow_transpolar_movement = true,
                extension_speed = 0.01,
                horizontal_turn_rate = 0.01,
                vertical_turn_rate = 0.002
            }
        },
        telescope_default_extention = 0.5
    },
    crane_energy_usage = "100kW",
    damaged_trigger_effect = {
        damage_type_filters = "fire",
        entity_name = "spark-explosion",
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
        offsets = {
            {
                0,
                1
            }
        },
        type = "create-entity"
    },
    drawing_box_vertical_extension = 2.5,
    dying_explosion = "agricultural-tower-explosion",
    energy_source = {
        emissions_per_minute = {
            spores = 4
        },
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_usage = "100kW",
    fast_replaceable_group = "agricultural-tower",
    flags = {
        "placeable-neutral",
        "placeable-player",
        "player-creation"
    },
    graphics_set = {
        animation = {
            layers = {
                {
                    animation_speed = 0.25,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base.png",
                    frame_count = 64,
                    height = 336,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        0,
                        -0.5625
                    },
                    width = 248
                },
                {
                    draw_as_shadow = true,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-shadow.png",
                    frame_count = 1,
                    height = 200,
                    line_length = 1,
                    priority = "high",
                    repeat_count = 64,
                    scale = 0.5,
                    shift = {
                        1.453125,
                        0.296875
                    },
                    width = 374
                }
            }
        },
        recipe_not_set_tint = {
            primary = {
                a = 1,
                b = 0.5,
                g = 0.6,
                r = 0.6
            },
            secondary = {
                a = 1,
                b = 0.5,
                g = 0.6,
                r = 0.6
            }
        },
        water_reflection = {
            orientation_to_variation = false,
            pictures = {
                filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-reflection.png",
                height = 36,
                priority = "extra-high",
                scale = 5,
                shift = {
                    0,
                    0.625
                },
                variation_count = 1,
                width = 24
            },
            rotate = false
        },
        working_visualisations = {
            {
                always_draw = true,
                animation = {
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base.png",
                    frame_count = 1,
                    height = 336,
                    line_length = 8,
                    scale = 0.5,
                    shift = {
                        0,
                        -0.5625
                    },
                    width = 248
                },
                fog_mask = {
                    falloff = 1,
                    rect = {
                        {
                            -30,
                            -30
                        },
                        {
                            30,
                            -2.75
                        }
                    }
                }
            },
            {
                always_draw = true,
                animation = {
                    animation_speed = 0.25,
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-plant-mask.png",
                    frame_count = 64,
                    height = 120,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        -0.40625,
                        -0.59375
                    },
                    tint_as_overlay = true,
                    width = 134
                },
                apply_recipe_tint = "primary"
            },
            {
                animation = {
                    animation_speed = 0.25,
                    blend_mode = "additive",
                    filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-light.png",
                    frame_count = 64,
                    height = 236,
                    line_length = 8,
                    priority = "high",
                    scale = 0.5,
                    shift = {
                        -0.15625,
                        -0.6875
                    },
                    width = 178
                },
                apply_recipe_tint = "secondary",
                effect = "flicker",
                fadeout = true
            },
            {
                effect = "flicker",
                fadeout = true,
                light = {
                    color = {
                        b = 1,
                        g = 1,
                        r = 1
                    },
                    intensity = 1,
                    shift = {
                        -0.45,
                        -0.25
                    },
                    size = 6
                }
            },
            {
                apply_recipe_tint = "secondary",
                effect = "flicker",
                fadeout = true,
                light = {
                    color = {
                        b = 1,
                        g = 1,
                        r = 1
                    },
                    intensity = 1,
                    shift = {
                        -1.2,
                        -0.5
                    },
                    size = 16
                }
            }
        }
    },
    grappler_extending_sound = {
        sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg",
            volume = 0.4
        },
        stopped_sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg",
            volume = 0.45
        }
    },
    grappler_extending_sound_source = "grappler-hub",
    grappler_orienting_sound = {
        sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg",
            volume = 0.25
        },
        stopped_sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg",
            volume = 0.4
        }
    },
    grappler_orienting_sound_source = "grappler-hub",
    harvesting_procedure_points = {
        {
            0,
            0,
            1
        }
    },
    harvesting_sound = {
        {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting-1.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting-2.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting-3.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting-4.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting-5.ogg",
            volume = 0.6
        },
        {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting-6.ogg",
            volume = 0.6
        }
    },
    heating_energy = "100kW",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    input_inventory_size = 3,
    max_health = 500,
    minable = {
        mining_time = 0.2,
        result = "agricultural-tower"
    },
    name = "agricultural-tower",
    open_sound = {
        filename = "__base__/sound/machine-open.ogg",
        volume = 0.5
    },
    planting_procedure_points = {
        {
            0,
            0,
            0.75
        },
        {
            0,
            0,
            0
        },
        {
            0,
            0.05,
            -0.05
        },
        {
            0.035355300000000001,
            0.035355300000000001,
            -0.1
        },
        {
            0.05,
            0,
            -0.15
        },
        {
            0.035355300000000001,
            -0.035355300000000001,
            -0.2
        },
        {
            0,
            -0.05,
            -0.25
        },
        {
            -0.035355300000000001,
            -0.035355300000000001,
            -0.3
        },
        {
            -0.05,
            0,
            -0.35
        },
        {
            -0.035355300000000001,
            0.035355300000000001,
            -0.4
        },
        {
            0,
            0,
            -0.45
        },
        {
            0,
            0,
            0
        }
    },

    radius = 3,
    radius_visualisation_picture = {
        filename = "__core__/graphics/white-square.png",
        height = 10,
        priority = "extra-high-no-scale",
        width = 10
    },
    resistances = {
        {
            percent = 100,
            type = "fire"
        }
    },
    selection_box = {
        {
            -1.5,
            -1.5
        },
        {
            1.5,
            1.5
        }
    },
    surface_conditions = {
        {
            max = 2000,
            min = 1000,
            property = "pressure"
        }
    },
    type = "agricultural-tower",
    working_sound = {
        audible_distance_modifier = 0.7,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        max_sounds_per_type = 4,
        sound = {
            filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg",
            volume = 0.7
        }
    }
}
