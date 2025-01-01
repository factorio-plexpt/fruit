data:extend({
    {
        type = "bool-setting",
        name = "fruit-recipe-enable",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "double-setting",
        name = "fruit-tree-multiplier",
        setting_type = "startup",
        default_value = 1,
        allowed_values = { 0.1, 0.5, 1, 2, 5, 10 },
    },
})
