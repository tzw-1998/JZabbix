local setmetatable = setmetatable
local unit = y3.unit.__index
local projectile = y3.projectile.__index

---构建直线运动器数据
---@param angle number 运动方向
---@param max_dist number 运动距离
---@param init_velocity number 初始速度
---@param acceleration number 加速度
---@param max_velocity number 最大速度
---@param min_velocity number 最小速度
---@param init_height number 初始高度
---@param fin_height number 终点高度
---@param parabola_height number 抛物线顶点高度
---@param collision_type number 碰撞类型
---@param collision_radius number 碰撞范围
---@param is_face_angle boolean 是否始终面向运动方向
---@param is_multi_collision boolean 能否重复碰撞同一单位
---@param terrain_block boolean 地形阻挡
---@param priority number 优先级
---@param is_absolute_height boolean 使用绝对高度
---@return mover_line_data 直线运动器数据
function y3.create_mover_line_data(
    angle,max_dist,init_velocity,acceleration,
    max_velocity,min_velocity,init_height,fin_height,parabola_height,collision_type,collision_radius,is_face_angle,is_multi_collision,terrain_block,priority,is_absolute_height
)

    local is_parabola_height = false
    local is_open_init_height = false
    local is_open_fin_height = false
    if parabola_height then is_parabola_height = true end
    if init_height then is_open_init_height = true end
    if fin_height then is_open_fin_height = true end

    local args = StraightMoverArgs()
    args.set_angle                  (Fix32(angle or 0))
    args.set_max_dist               (Fix32(max_dist or 99999))
    args.set_init_velocity          (Fix32(init_velocity or 0))
    args.set_acceleration           (Fix32(acceleration or 0))
    args.set_max_velocity           (Fix32(max_velocity or 99999))
    args.set_min_velocity           (Fix32(min_velocity or 0))
    args.set_init_height            (Fix32(init_height or 0))
    args.set_fin_height             (Fix32(fin_height or 0))
    args.set_parabola_height        (Fix32(parabola_height or 0))
    args.set_collision_type         (collision_type or 0)
    args.set_collision_radius       (Fix32(collision_radius or 0.0))
    args.set_is_face_angle          (is_face_angle or false)
    args.set_is_multi_collision     (is_multi_collision or false)
    args.set_terrain_block          (terrain_block or false)
    args.set_priority               (priority or 1)
    args.set_is_parabola_height     (is_parabola_height or false)
    args.set_is_absolute_height     (is_absolute_height or false)
    args.set_is_open_init_height    (is_open_init_height or false)
    args.set_is_open_fin_height     (is_open_fin_height or false)
    return args
end

---构建追踪运动器数据
---@param target unit|item|destructible|projectile 追踪目标
---@param stop_distance number 停止距离
---@param init_velocity number 初始速度
---@param acceleration number 加速度
---@param max_velocity number 最大速度
---@param min_velocity number 最小速度
---@param init_height number 初始高度
---@param bind_point string 追踪挂接点
---@param collision_type number 碰撞类型
---@param collision_radius number 碰撞范围
---@param is_face_angle boolean 是否始终面向运动方向
---@param is_multi_collision boolean 能否重复碰撞同一单位
---@param terrain_block boolean 地形阻挡
---@param priority number 优先级
---@param is_absolute_height boolean 使用绝对高度
---@return mover_target_data 追踪运动器数据
function y3.create_mover_target_data(
    target,stop_distance,init_velocity,acceleration,
    max_velocity,min_velocity,init_height,bind_point,collision_type,collision_radius,is_face_angle,is_multi_collision,terrain_block,priority,is_absolute_height,parabola_height
)

    local is_parabola_height = false
    local is_open_init_height = false
    local is_open_bind_point = false
    if parabola_height then is_parabola_height = true end
    if init_height then is_open_init_height = true end
    if bind_point then is_open_bind_point = true end

    local args = ChasingMoverArgs()
    args.set_stop_distance_to_target(Fix32(stop_distance or 0.0))
    args.set_init_velocity          (Fix32(init_velocity or 0))
    args.set_acceleration           (Fix32(acceleration or 0))
    args.set_max_velocity           (Fix32(max_velocity or 99999))
    args.set_min_velocity           (Fix32(min_velocity or 0))
    args.set_init_height            (Fix32(init_height or 0))
    args.set_bind_point             (bind_point or '')
    args.set_collision_type         (collision_type or 0)
    args.set_collision_radius       (Fix32(collision_radius or 0.0))
    args.set_is_face_angle          (is_face_angle or false)
    args.set_is_multi_collision     (is_multi_collision or false)
    args.set_terrain_block          (terrain_block or false)
    args.set_priority               (priority or 1)
    args.set_is_absolute_height     (is_absolute_height or false)
    args.set_is_open_init_height    (is_open_init_height)
    args.set_is_parabola_height     (is_parabola_height)
    args.set_parabola_height        (Fix32(parabola_height or 0))
    args.set_is_open_bind_point     (is_open_bind_point)
    args.set_target_unit_id         (target.base().id)

    print(args.target_unit_id)
    return args
end

---构建曲线运动器数据
---@param angle number 运动方向
---@param max_dist number 运动距离
---@param init_velocity number 初始速度
---@param acceleration number 加速度
---@param path table 平面路径表
---@param max_velocity number 最大速度
---@param min_velocity number 最小速度
---@param init_height number 初始高度
---@param fin_height number 终点高度
---@param collision_type number 碰撞类型
---@param collision_radius number 碰撞范围
---@param is_face_angle boolean 是否始终面向运动方向
---@param is_multi_collision boolean 能否重复碰撞同一单位
---@param terrain_block boolean 地形阻挡
---@param priority number 优先级
---@param is_absolute_height boolean 使用绝对高度
---@return mover_curve_data 曲线运动器数据
function y3.create_mover_curve_data(
    angle,max_dist,init_velocity,acceleration,path,
    max_velocity,min_velocity,init_height,fin_height,collision_type,collision_radius,is_face_angle,is_multi_collision,terrain_block,priority,is_absolute_height
)

    local is_open_init_height = false
    local is_open_fin_height = false
    if init_height then is_open_init_height = true end
    if fin_height then is_open_fin_height = true end

    local args = CurvedMoverArgs()
    args.set_angle                  (Fix32(angle or 0))
    args.set_max_dist               (Fix32(max_dist or 99999))
    args.set_init_velocity          (Fix32(init_velocity or 0))
    args.set_acceleration           (Fix32(acceleration or 0))
    args.set_path                   (path)
    args.set_max_velocity           (Fix32(max_velocity or 99999))
    args.set_min_velocity           (Fix32(min_velocity or 0))
    args.set_init_height            (Fix32(init_height or 0))
    args.set_fin_height             (Fix32(fin_height or 0))
    args.set_collision_type         (collision_type or 0)
    args.set_collision_radius       (Fix32(collision_radius or 0.0))
    args.set_is_face_angle          (is_face_angle or false)
    args.set_is_multi_collision     (is_multi_collision or false)
    args.set_terrain_block          (terrain_block or false)
    args.set_priority               (priority or 1)
    args.set_is_absolute_height     (is_absolute_height or false)
    args.set_is_open_init_height    (is_open_init_height or false)
    return args
end


---构建环绕运动器数据
---@param target point|unit 环绕目标
---@param circle_radius number 圆周半径
---@param angle_velocity number 角速度
---@param init_angle number 初始角度
---@param counterclockwise number 方向
---@param round_time number 环绕时间
---@param centrifugal_velocity number 离心速度
---@param lifting_velocity number 提升速度
---@param around_init_height number 环绕高度
---@param collision_type number 碰撞类型
---@param collision_radius number 碰撞范围
---@param is_face_angle boolean 是否始终面向运动方向
---@param is_multi_collision boolean 能否重复碰撞同一单位
---@param terrain_block boolean 地形阻挡
---@param priority number 优先级
---@param is_absolute_height boolean 使用绝对高度
---@return mover_round_data 环绕运动器数据
function y3.create_mover_round_data(
    target,circle_radius,angle_velocity,
    init_angle,counterclockwise,round_time,centrifugal_velocity,lifting_velocity,around_init_height,collision_type,collision_radius,is_face_angle,is_multi_collision,terrain_block,priority,is_absolute_height
)

    local args = RoundMoverArgs()
    if target.type == 'unit' then
        args.set_is_to_unit(true)
        args.set_target_unit_id( target.base())
    else
        args.set_is_to_unit(false)
        args.set_target_pos( target.base())
    end
    args.set_circle_radius          (Fix32(circle_radius or 0.0))
    args.set_angle_velocity         (Fix32(angle_velocity or 0.0))
    args.set_init_angle             (Fix32(init_angle or 0.0))
    args.set_counterclockwise       (Fix32(counterclockwise))
    args.set_round_time             (Fix32(round_time or 0))
    args.set_centrifugal_velocity   (Fix32(centrifugal_velocity or 0))
    args.set_lifting_velocity       (Fix32(lifting_velocity or 0))
    args.set_around_init_height     (Fix32(around_init_height or 0))
    args.set_collision_type         (collision_type or 0)
    args.set_collision_radius       (Fix32(collision_radius or 0.0))
    args.set_is_face_angle          (is_face_angle or false)
    args.set_is_multi_collision     (is_multi_collision or false)
    args.set_terrain_block          (terrain_block or false)
    args.set_priority               (priority or 1)
    args.set_is_absolute_height     (is_absolute_height or false)

    return args
end
