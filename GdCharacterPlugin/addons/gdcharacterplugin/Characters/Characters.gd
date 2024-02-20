extends Node
class_name Characters

#经验值 
var experience :int:
	get:
		return experience
	set(v):
		if typeof(v) != TYPE_INT:
			return
		experience += v

#等级不写死，直接根据经验值来回传，初始化为1
var level:int = 1 :
	get:
		#按照经验曲线 计算等级
		
		level = max(1,level)
		level = min(level,65)
		return level

#昵称
var nick_name :String

#预制体 无需移动/碰撞等  直接挂载Node2D
var prefab 

#生命值
var max_health :float
var cur_health :float:
	get:
		return int(cur_health)
	set(v):
		cur_health = max(0,cur_health + v)
		cur_health = min(cur_health,max_health)

#魔法值
var max_mana :float
var cur_mana :float:
	get:
		return int(cur_mana)
	set(v):
		cur_mana = max(0,cur_mana + v)
		cur_mana = min(cur_mana,max_mana)

#技能
var skills

#装备
var equips

#buff 配合buff插件使用
var buffs

#属性
var attribute :Attribute

func _init(_data:Dictionary) -> void:
	attribute  = Attribute.new(_data["base_attr"])
	
	experience = _data["experience"]
	nick_name  = _data["nick_name"]
	prefab     = _data["prefab"]
	
	cur_health = _data["cur_health"]
	cur_mana   = _data["cur_mana"]
	
	
func _ready() -> void:
	max_health = get_max_health()
	max_mana   = get_max_mana()
	_update_prefab("")

#更新预制体
func _update_prefab(_path:String) -> void:
	_path = "res://node_2_dss.tscn"
	prefab = load(_path)

#虚函数 最大生命值 
func get_max_health() -> float:
	return 0
	
#最大魔法值 敌人这里需要重写
func get_max_mana() -> float:
	return 0

#虚函数 使用技能
func select_skill(index:int) -> void:
	return 
