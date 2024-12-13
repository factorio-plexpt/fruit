### 农业塔原型

**使用要求**：需要"太空时代"才能使用新的"农业塔"。

**继承关系**：继承自EntityWithOwnerPrototype ← EntityWithHealthPrototype ← EntityPrototype ← Prototype ← PrototypeBase

**属性**：

| 属性名 | 类型 | 是否可选 | 描述 |
| --- | --- | --- | --- |
| graphics_set | CraftingMachineGraphicsSet | 可选 | 定义农业塔的图形设置，包括动画和外观。 |
| crane | AgriculturalCraneProperties | 必选 | 定义农业塔的起重机属性，包括其移动和操作方式。 |
| energy_source | EnergySource | 必选 | 定义农业塔的能量来源，如电力或燃料。 |
| input_inventory_size | ItemStackIndex | 必选 | 定义农业塔输入库存的大小。 |
| output_inventory_size | ItemStackIndex | 可选 | 定义农业塔输出库存的大小。 |
| energy_usage | Energy | 必选 | 定义农业塔在正常运行时的能量消耗。 |
| crane_energy_usage | Energy | 必选 | 定义农业塔起重机在操作时的能量消耗。 |
| random_growth_offset | double | 可选 | 定义作物生长的随机偏移量，必须大于等于0且小于1。 |
| growth_grid_tile_size | uint32 | 可选 | 定义作物生长网格的瓦片大小，必须为正数。 |
| central_orienting_sound | InterruptibleSound | 可选 | 定义农业塔中央定位器的声音效果。 |
| arm_extending_sound | InterruptibleSound | 可选 | 定义农业塔起重机臂伸展时的声音效果。 |
| grappler_orienting_sound | InterruptibleSound | 可选 | 定义农业塔抓取器定位时的声音效果。 |
| grappler_extending_sound | InterruptibleSound | 可选 | 定义农业塔抓取器伸展时的声音效果。 |
| planting_sound | Sound | 可选 | 定义农业塔种植作物时的声音效果。 |
| harvesting_sound | Sound | 可选 | 定义农业塔收获作物时的声音效果。 |
| radius_visualisation_picture | Sprite | 可选 | 定义农业塔作用半径的可视化图形。 |
| radius | double | 必选 | 定义农业塔的作用半径，必须为正数。 |
| central_orienting_sound_source | string | 可选 | 定义中央定位器声音效果的来源。 |
| arm_extending_sound_source | string | 可选 | 定义起重机臂伸展声音效果的来源。 |
| grappler_orienting_sound_source | string | 可选 | 定义抓取器定位声音效果的来源。 |
| grappler_extending_sound_source | string | 可选 | 定义抓取器伸展声音效果的来源。 |
| planting_procedure_points | array[Vector3D] | 可选 | 定义种植过程的关键点位置数组。 |
| harvesting_procedure_points | array[Vector3D] | 可选 | 定义收获过程的关键点位置数组。 |
| circuit_wire_max_distance | double | 可选 | 定义该实体的最大电路线距离。 |
| draw_copper_wires | bool | 可选 | 定义是否绘制铜线。 |
| draw_circuit_wires | bool | 可选 | 定义是否绘制电路线。 |
| circuit_connector | CircuitConnectorDefinition | 可选 | 定义电路连接器的定义。 |

这些属性定义了农业塔原型的各种特性和行为，包括其外观、声音效果、能量消耗、操作方式以及与电路系统的交互等。

### AgriculturalCraneProperties 结构体

**属性**：

| 属性名 | 类型 | 是否可选 | 描述 |
| --- | --- | --- | --- |
| speed | AgriculturalCraneSpeed | 必选 | 定义农业塔起重机的速度属性。 |
| min_arm_extent | double | 可选 | 定义起重机臂的最小伸展长度。 |
| min_grappler_extent | double | 可选 | 定义抓取器的最小伸展长度。 |
| operation_angle | float | 可选 | 定义起重机的操作角度，以度为单位。 |
| telescope_default_extention | double | 可选 | 定义望远镜的默认伸展长度。 |
| origin | Vector3D | 必选 | 定义起重机的原点位置。 |
| shadow_direction | Vector3D | 必选 | 定义起重机阴影的方向。 |
| parts | array[CranePart] | 必选 | 定义起重机的组成部分数组。 |

这些属性定义了农业塔起重机的各种特性和行为，包括其速度、伸展长度、操作角度、原点位置、阴影方向以及组成部分等。
