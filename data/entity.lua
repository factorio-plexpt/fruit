if mods["space-age"] then


    local tower = table.deepcopy(data.raw["agricultural-tower"]["agricultural-tower"])

    tower.name = "super-tower"
    --	定义作物生长的随机偏移量，必须大于等于0且小于1。 默认0.25
    tower.random_growth_offset = 0
    --定义作物生长网格的瓦片大小，必须为正数。 默认3
    tower.growth_grid_tile_size = 4

    tower.input_inventory_size = 10

    tower.output_inventory_size = 10

    tower.radius = 8

    data:extend { tower }
end
