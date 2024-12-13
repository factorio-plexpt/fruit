require("data.fruit")
require("data.vegetable")
require("data.animal_products")
require("data.plant")
require("data.entity")

data:extend(
        {
            {
                type = "item-group",
                name = "fruit",
                icon =   "__fruit__/graphics/group.png",
                icon_size = 512,
            }
        }
)

data:extend({
    {
        type = "item-subgroup",
        name = "fruit",
        group = "fruit",
        order = "a"
    },
    {
        type = "item-subgroup",
        name = "vegetable",
        group = "fruit",
        order = "b"
    },
    {
        type = "item-subgroup",
        name = "animal_products",
        group = "fruit",
        order = "c"
    },

    {
        type = "item-subgroup",
        name = "fruit_tree",
        group = "fruit",
        order = "z"
    },
})
