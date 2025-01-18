require("safe_call")
MyEvent = require("lib.EventDispatcher")


require("runtime.corehub")
require("runtime.restaurant")
require("runtime.egg")


---- INIT ----
-- 初始化事件，当游戏加载或重置时调用
local function on_init()
    storage.fruit = storage.fruit or {}
    -- 初始化存储表，用于存储实体和电源实体
    storage.fruit.entities = storage.fruit.entities or {}
    storage.fruit.restaurant = storage.fruit.restaurant or {} -- 使用复数形式以区分两个生成器
    storage.fruit.unit = storage.fruit.unit or {} -- 使用复数形式以区分两个生成器
    storage.fruit.corehubs = storage.fruit.corehubs or {} -- 使用复数形式以区分两个生成器
end



MyEvent.on_init(on_init)
MyEvent.on_configuration_changed(on_init)


if script.active_mods["gvv"] then require("__gvv__.gvv")() end




