local names = {
    wheat = "dried-wheat",
    ["rice-grain"] = "dried-rice",
    ["fermented-cocoa-bean"] = "dried-cocoa-bean",
    ["fermented-coffee-seed"] = "dried-coffee-seed",
}

for name, spoil_result in pairs(names) do

    data.raw.item[name].spoil_ticks = 2 * minute
    data.raw.item[name].spoil_result = spoil_result

end
