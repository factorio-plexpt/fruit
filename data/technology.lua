local prerequisites = {}
if mods["planet-woodoria"] then
    prerequisites = { "planet-discovery-woodoria" }
end

TECHNOLOGY {
    type = "technology",
    name = "food-processing",
    icon = "__fruit__/graphics/icon/place.png",
    icon_size = 512,
    effects = {
    },
    prerequisites = prerequisites,
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "wine",
    icon = "__fruit__/graphics/icon/wine.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}

TECHNOLOGY {
    type = "technology",
    name = "cooking",
    icon = "__fruit__/graphics/icon/mapo-tofu.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}

TECHNOLOGY {
    type = "technology",
    name = "fruit-juicing",
    icon = "__fruit__/graphics/juice.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}
TECHNOLOGY {
    type = "technology",
    name = "jam-making",
    icon = "__fruit__/graphics/jam.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}

TECHNOLOGY {
    type = "technology",
    name = "pie-baking",
    icon = "__fruit__/graphics/pie.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}
TECHNOLOGY {
    type = "technology",
    name = "ice-cream-making",
    icon = "__fruit__/graphics/icon/icecream5.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}

TECHNOLOGY {
    type = "technology",
    name = "fruit-cultivation",
    icon = "__fruit__/graphics/tree/apple.png",
    icon_size = 512,
    effects = {
    },
    prerequisites = { "advanced-farm" },
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "animal-husbandry",
    icon = "__fruit__/graphics/icon/animal-husbandry.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "advanced-farm" },
    unit = {
        count = 1500,
        time = 3,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
    },
}

TECHNOLOGY {
    type = "technology",
    name = "vegetable-cultivation",
    icon = "__fruit__/graphics/tree/lettuce.png",
    icon_size = 512,
    effects = {
    },
    prerequisites = { "advanced-farm" },
    unit = {
        count = 1000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "sugar-processing",
    icon = "__fruit__/graphics/icon/sugar.png",
    icon_size = 512,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "sugar"
        }
    },
    prerequisites = { "food-processing" }, --需要化学科技解锁
    unit = {
        count = 500,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        -- 10-60
        time = 3,
    },
    order = "b-f-b"
}

-- 定义面粉科技
TECHNOLOGY {
    type = "technology",
    name = "wheat-processing",
    icon = "__fruit__/graphics/vegetable/wheat.png",
    icon_size = 512,
    localised_name = { "", { "item-name.wheat" } },
    localised_description = { "", { "item-description.wheat" } },
    effects = {
        { type = "unlock-recipe", recipe = "wheat-peeling" },
        { type = "unlock-recipe", recipe = "wheat-milling" },

    },
    prerequisites = { "food-processing" },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "fermentation",
    icon = "__fruit__/graphics/icon/dough.png",
    icon_size = 512,
    effects = {
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 1200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}
TECHNOLOGY {
    type = "technology",
    name = "baking",
    icon = "__fruit__/graphics/icon/bread.png",
    icon_size = 512,
    effects = {
    },
    prerequisites = { "fermentation" },
    unit = {
        count = 1200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}
TECHNOLOGY {
    type = "technology",
    name = "barbecuing",
    icon = "__fruit__/graphics/icon/grilled-asparagus.png",
    icon_size = 512,
    effects = {
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 1200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "drying",
    icon = "__fruit__/graphics/entity/drying.png",
    icon_size = 1024,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 12000,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "brewing",
    icon = "__fruit__/graphics/entity/oak.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "wine" },
    unit = {
        count = 1200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "frying",
    icon = "__fruit__/graphics/icon/hamburger.png",
    icon_size = 512,
    effects = {},
    prerequisites = { "food-processing" },
    unit = {
        count = 1200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}

TECHNOLOGY {
    type = "technology",
    name = "rice-processing",
    icon = "__fruit__/graphics/icon/rice.png",
    icon_size = 512,
    effects = {
        { type = "unlock-recipe", recipe = "rice-husking" },
        { type = "unlock-recipe", recipe = "rice-flour-grinding" },
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 500,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
        time = 3,
    },
}

TECHNOLOGY {
    type = "technology",
    name = "vinegar-wheat",
    icon = "__fruit__/graphics/icon/vinegar.png",
    icon_size = 512,
    localised_name = { "item-name.vinegar" },
    localised_description = { "", { "item-description.vinegar" } },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "vinegar-wheat"
        },
    },
    prerequisites = { "fermentation" },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}
TECHNOLOGY {
    type = "technology",
    name = "soy_sauce",
    icon = "__fruit__/graphics/icon/soy_sauce.png",
    icon_size = 512,
    localised_name = { "item-name.soy_sauce" },
    localised_description = { "", { "item-description.soy_sauce" } },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "soy_sauce"
        },
    },
    prerequisites = { "fermentation" },
    unit = {
        count = 200,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}
TECHNOLOGY {
    type = "technology",
    name = "chocolate-processing",
    icon = "__fruit__/graphics/icon/chocolate.png",
    icon_size = 512,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "cocoa-bean-extraction"
        },
        {
            type = "unlock-recipe",
            recipe = "cocoa-bean-fermentation"
        },
        {
            type = "unlock-recipe",
            recipe = "cocoa-bean-roasting"
        },
        {
            type = "unlock-recipe",
            recipe = "cocoa-powder-grinding"
        },
        {
            type = "unlock-recipe",
            recipe = "cocoa-liquor"
        },
        {
            type = "unlock-recipe",
            recipe = "refined-chocolate"
        },

        {
            type = "unlock-recipe",
            recipe = "chocolate-bar-molding"
        },
    },
    prerequisites = { "fermentation" },
    unit = {
        count = 500,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 3
    },
}
TECHNOLOGY {
    type = "technology",
    name = "wool-processing",
    icon = "__fruit__/graphics/icon/wool.png",
    icon_size = 512,
    effects = {
        { type = "unlock-recipe", recipe = "wool-cleaning" },
        { type = "unlock-recipe", recipe = "wool-spinning" },
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 100,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
        },
        time = 3,
    },
}

TECHNOLOGY {
    type = "technology",
    name = "coffee-processing",
    icon = "__fruit__/graphics/icon/coffee-bean.png",
    icon_size = 512,
    effects = {
        { type = "unlock-recipe", recipe = "coffee-seed-fermentation" },
        { type = "unlock-recipe", recipe = "coffee-seed-roasting" },
        { type = "unlock-recipe", recipe = "coffee-powder-grinding" },
        { type = "unlock-recipe", recipe = "coffee-powder-grinding" },
        { type = "unlock-recipe", recipe = "coffee" },
    },
    prerequisites = { "fermentation" },
    unit = {
        count = 300,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 5
    },
}

TECHNOLOGY {
    type = "technology",
    name = "potato-processing",
    icon = "__fruit__/graphics/icon/potato.png",
    icon_size = 512,
    effects = {
        { type = "unlock-recipe", recipe = "potato-peeling" },
        { type = "unlock-recipe", recipe = "potato-washing" },
        { type = "unlock-recipe", recipe = "potato-slicing" },
        { type = "unlock-recipe", recipe = "potato-shredding" },
        { type = "unlock-recipe", recipe = "potato-dicing" },
        { type = "unlock-recipe", recipe = "potato-frying-slices" },
        { type = "unlock-recipe", recipe = "potato-frying-shreds" },
        { type = "unlock-recipe", recipe = "mashed-potato-making" },
        { type = "unlock-recipe", recipe = "baked-potato-making" },
    },
    prerequisites = { "food-processing" },
    unit = {
        count = 300,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 5
    },
}
