local tree01 = data.raw.tree["tree-01"]
local mining_trigger = tree01.minable.mining_trigger

second = 60
minute = 60 * second
hour = 60 * minute

local function get_tile(name, count, names)
    local names = names or {}
    for i = 1, count do
        table.insert(names, name .. i)
    end
    return names
end

local function get_alien(names)
    local names = names
    if mods["alien-biomes"] then
        names = get_tile("mineral-aubergine-dirt-", 6, names)
        names = get_tile("mineral-beige-dirt-", 6, names)
        names = get_tile("mineral-black-dirt-", 6, names)
        names = get_tile("mineral-brown-dirt-", 6, names)
        names = get_tile("mineral-cream-dirt-", 6, names)
        names = get_tile("mineral-dustyrose-dirt-", 6, names)
        names = get_tile("mineral-grey-dirt-", 6, names)
        names = get_tile("mineral-purple-dirt-", 6, names)
        names = get_tile("mineral-red-dirt-", 6, names)
        names = get_tile("mineral-tan-dirt-", 6, names)
        names = get_tile("mineral-white-dirt-", 6, names)
        names = get_tile("vegetation-green-grass-", 4, names)
    end
    return names
end

local fruit_index = 1
local function make_tree(name, count, size)
    local variations = {}

    -- 插入元素，包含数字
    for i = 1, count do
        variations[#variations + 1] = {
            trunk = {
                filename = "__fruit__/graphics/tree/" .. name .. i .. ".png",
                height = size,
                width = size,
                scale = 0.3,
                shift = { 0, -1 },
                frame_count = 1,
                repeat_count = 2,
            },
            leaves = {
                filename = "__fruit__/graphics/tree/" .. name .. i .. ".png",
                height = size,
                width = size,
                scale = 0.3,
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

    local names = get_alien({ "grass-1", "grass-2", "grass-3", "grass-4",
                              "dirt-1", "dirt-2", "dirt-3", "dirt-4", "dirt-5", "dirt-6", "dirt-7",
                              "dry-dirt", "sand-1", "sand-2", "sand-3", })
    if mods["planet-woodoria"] then
        table.insert(names, "woodoria-wood-1")
    end

    local volume = 5000 * (1 / settings.startup["fruit-tree-multiplier"].value)

    local plant = {
        type = "plant",
        --type = has_dlc and "plant" or "tree",
        name = name,
        icon = "__fruit__/graphics/tree/" .. name .. ".png",
        icon_size = size,
        flags = { "placeable-neutral", "breaths-air" },
        minable = {
            results = { { type = "item", name = name, amount = 50 },
                        { type = "item", name = "wood", amount_min = 2, amount_max = 10, probability = 0.5 }
            },
            mining_particle = "wooden-particle",
            mining_time = 0.5,
            mining_trigger = mining_trigger
        },
        mined_sound = tree01.mined_sound,
        growth_ticks = 5 * minute, -- has_dlc and 5 * minute or nil,
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
            probability_expression = "random(" .. volume .. ", " .. math.random(1, 100000) .. ") < 1",
            order = "fruit-tree-" .. name,
            tile_restriction = names,
        },

        --autoplace = {
        --    --probability_expression = "clamp(random_penalty_at(4, 1), 0, 1)",
        --    control = "trees",
        --    order = "fruit-tree-" .. name,
        --    probability_expression = "tree_0" .. ((fruit_index - 1) % 9 + 1),
        --},
    }

    data:extend { plant }
    --log("add plant_result for " .. name)
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
    ["cocoa-pod"] = 1,
    ["coffee-seed"] = 1,
    ["rice-grain"] = 1,
    eggplant = 1,
    garlic = 1,
    lettuce = 1,
    onion = 1,
    pea = 1,
    potato = 1,
    pumpkin = 1,
    sugarcane = 1,
    sweet_potato = 4,
    tomato = 1,
    zucchini = 1,
    wheat = 1,
    cucumber = 1,
    ginger = 1,
    elderberry = 1,
    grapefruit = 1,
    guava = 1,
    longan = 1,
    loquat = 1,
    mulberry = 1,
    carambola = 1,
    jackfruit = 1,

    soybeans = 1,
    artichoke = 1,
    asparagus = 1,
    corn = 1,
    beetroot = 1,
    brussels_sprout = 1,
    cauliflower = 1,
    celery = 1,
    chayote = 1,
    parsnip = 1,
    daikon = 1,
    jicama = 1,
    kale = 1,
    leek = 1,
    turnip = 1,
    spinach = 1,
    okra = 1,
    agave = 1,
}

fruit_plant_woodoria = fruit_plant_woodoria or {}

for name, count in pairs(fruits) do
    local size = 512

    make_tree(name, count, size)
    if mods["planet-woodoria"] then
        table.insert(fruit_plant_woodoria, name)
    else
        for k, planet in pairs(data.raw["planet"]) do
            if planet.map_gen_settings and planet.map_gen_settings.autoplace_settings then
                planet.map_gen_settings.autoplace_settings.entity.settings[name] = {}
            end
        end
    end

end
