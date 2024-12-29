require("data.orders")

local function add_science_pack(tech, pack)
    if tech.unit and tech.unit.ingredients then
        -- 检查是否已经包含农业科研包，避免重复添加
        for _, ingredient in pairs(tech.unit.ingredients) do
            if ingredient[1] == pack then
                return -- 如果已经存在，直接返回
            end
        end

        -- 插入农业科研包
        table.insert(tech.unit.ingredients, { pack, 1 })
    end
end

local science_packs_all = {
    "automation-science-pack",
    "logistic-science-pack",
    "chemical-science-pack",
    "military-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
    "metallurgic-science-pack",
    "electromagnetic-science-pack",
    "agricultural-science-pack",
    "cryogenic-science-pack",
    "promethium-science-pack",
    "restaurant-science-pack"
}
local science_packs = {
    ["production-science-pack"] = true,
    ["utility-science-pack"] = true,
    ["space-science-pack"] = true,
    ["metallurgic-science-pack"] = true,
    ["electromagnetic-science-pack"] = true,
    ["agricultural-science-pack"] = true,
    ["cryogenic-science-pack"] = true,
    ["promethium-science-pack"] = true,
}
local excludes = {
    ["cerys-science-pack"] = true,
    ["military-science-pack"] = true,
}

for _, tech in pairs(data.raw.technology) do
    if tech.unit and tech.unit.ingredients then
        -- 检查是否包含 "space-science-pack"

        local add_to_tech = false
        for _, ingredient in pairs(tech.unit.ingredients) do
            if science_packs[ingredient[1]] then
                -- 如果包含 "space-science-pack"，添加 "agriculture-science-pack"
                add_to_tech = true
            end

            if excludes[ingredient[1]] then
                -- 如果包含 "space-science-pack"，添加 "agriculture-science-pack"
                add_to_tech = false
                break
            end
        end

        if add_to_tech then
            add_science_pack(tech, "restaurant-science-pack")
        end
    end
end
