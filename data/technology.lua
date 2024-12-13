data:extend({
    {
        type = "technology",
        name = "sugar-processing",
        icon = "__fruit__/graphics/juice.png",
        icon_size = 512,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "sugar"
            }
        },
        prerequisites = { "oil-processing" }, --需要化学科技解锁
        unit = {
            count = 500,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 }
            },
            time = 30
        },
        order = "b-f-b"
    }
})
