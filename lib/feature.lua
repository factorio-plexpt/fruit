local all = {
    "quality_required",
    "space_travel_required",
    "spoiling_required",
    "freezing_required",
    "segmented_units_required",
    "expansion_shaders_required",
    "rail_bridges_required"
}




heating_energy = feature_flags["freezing"] and "100kW" or nil
heating_energy = feature_flags["spoiling"] and "100kW" or nil

