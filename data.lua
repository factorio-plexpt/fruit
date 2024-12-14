require("data.fruit")
require("data.vegetable")
require("data.animal_products")
require("data.item")
require("data.plant")
require("data.recipe")
require("data.technology")
require("data.entity")
require("data.juice")

--group
data:extend {
    {
        type = "item-group",
        name = "fruit",
        icon = "__fruit__/graphics/group.png",
        icon_size = 512,
    },

    {
        type = "fuel-category",
        name =  "fruit"
    }
}

--subgroup
data:extend {
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
    {
        type = "item-subgroup",
        name = "fruit_plant",
        group = "fruit",
        order = "z"
    },
    {
        type = "item-subgroup",
        name = "fruit_juice",
        group = "fruit",
        order = "j"
    },
    {
        type = "item-subgroup",
        name = "fruit_jam",
        group = "fruit",
        order = "j"
    },
    {
        type = "item-subgroup",
        name = "fruit_pie",
        group = "fruit",
        order = "j"
    },
    {
        type = "item-subgroup",
        name = "fruit_product",
        group = "fruit",
        order = "j"
    },
}
