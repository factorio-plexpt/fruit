for _, lab in pairs(data.raw["lab"]) do
    if lab.inputs then
        local packname = "restaurant-science-pack"
        table.insert(lab.inputs, packname)
    end
end

