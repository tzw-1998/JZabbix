local setmetatable = setmetatable
local unit = y3.unit.__index
local projectile = y3.projectile.__index

require 'y3.runtime_object.mover_data'

---创建直线运动器
---@param mover_data mover_line_data 数据(y3.create_mover_line_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function unit:mover_line(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'StraightMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建直线运动器
---@param mover_data mover_line_data 数据(y3.create_mover_line_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function projectile:mover_line(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'StraightMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建追踪运动器
---@param mover_data mover_target_data 数据(y3.create_mover_target_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function unit:mover_target(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'ChasingMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建追踪运动器
---@param mover_data mover_target_data 数据(y3.create_mover_target_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function projectile:mover_target(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'ChasingMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建曲线运动器
---@param mover_data mover_curve_data 数据(y3.create_mover_curve_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function unit:mover_curve(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'CurvedMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建曲线运动器
---@param mover_data mover_curve_data 数据(y3.create_mover_curve_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function projectile:mover_curve(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'CurvedMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建环绕运动器
---@param mover_data mover_round_data 数据(y3.create_mover_round_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function unit:mover_round(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'RoundMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---创建环绕运动器
---@param mover_data mover_round_data 数据(y3.create_mover_round_data)
---@param unit_collide function 单位碰撞
---@param mover_finish function 运动完成
---@param terrain_collide function 地形碰撞
---@param mover_interrupt function 运动打断
---@param mover_removed function 运动移除
function projectile:mover_round(mover_data,unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
    self.base():create_mover_trigger(mover_data,'RoundMover',unit_collide,mover_finish,terrain_collide,mover_interrupt,mover_removed)
end

---打断单位运动器
---@param owner unit 单位/投射物
function y3.break_mover_on_owner(owner)
    game_api.break_unit_mover(owner.base())
end

---移除单位运动器
---@param owner unit 单位/投射物
function y3.remove_mover_on_owner(owner)
    game_api.remove_unit_mover(owner.base())
end

---打断运动器
function unit:break_mover()
    game_api.break_unit_mover(self.base())
end

---移除运动器
function unit:remove_mover()
    game_api.remove_unit_mover(self.base())
end

---打断运动器
function projectile:break_mover()
    game_api.break_unit_mover(self.base())
end

---移除运动器
function projectile:remove_mover()
    game_api.remove_unit_mover(self.base())
end
