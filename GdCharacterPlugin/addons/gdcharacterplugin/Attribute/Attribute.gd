extends Object
class_name Attribute

var base_attr  :BaseAttribute
var skill_attr :AdvancedAttributes
var equip_attr :AdvancedAttributes
var buff_attr  :AdvancedAttributes

func _init(_data:Dictionary) -> void:
	base_attr  = BaseAttribute.new(_data)
	
	skill_attr = AdvancedAttributes.new()
	equip_attr = AdvancedAttributes.new()
	buff_attr  = AdvancedAttributes.new()

#力量
var strength:float:
	get:
		var basic := base_attr.strength + skill_attr.strength + equip_attr.strength
		var rate  := skill_attr.strength_rate + equip_attr.strength_rate
		var final := basic * (1 + rate)
		return final
#体质
var constitution:float:
	get:
		var basic := base_attr.constitution + skill_attr.constitution + equip_attr.constitution
		var rate  := skill_attr.constitution_rate + equip_attr.constitution_rate
		var final := basic * (1 + rate)
		return final
#敏捷
var agility:float:
	get:
		var basic := base_attr.agility + skill_attr.agility + equip_attr.agility
		var rate  := skill_attr.agility_rate + equip_attr.agility_rate
		var final := basic * (1 + rate)
		return final
#灵巧
var dexterity:float:
	get:
		var basic := base_attr.dexterity + skill_attr.dexterity + equip_attr.dexterity
		var rate  := skill_attr.dexterity_rate + equip_attr.dexterity_rate
		var final := basic * (1 + rate)
		return final
#智力
var intellect:float:
	get:
		var basic := base_attr.intellect + skill_attr.intellect + equip_attr.intellect
		var rate  := skill_attr.intellect_rate + equip_attr.intellect_rate
		var final := basic * (1 + rate)
		return final
#感知
var perception:float:
	get:
		var basic := base_attr.perception + skill_attr.perception + equip_attr.perception
		var rate  := skill_attr.perception_rate + equip_attr.perception_rate
		var final := basic * (1 + rate)
		return final


# 高级属性 攻击属性 开始______________________________________
#出手速度
var speed:float:
	get:
		var basic := agility * 2 + perception + skill_attr.speed + equip_attr.speed + buff_attr.speed
		var rate  := skill_attr.speed_rate + equip_attr.speed_rate + buff_attr.speed_rate
		var final := basic * (1 + rate)
		return final
#物理命中
var phyhit:float:
	get:
		var basic := skill_attr.phyhit + equip_attr.phyhit + buff_attr.phyhit
		var rate  := skill_attr.phyhit_rate + equip_attr.phyhit_rate + buff_attr.phyhit_rate
		var final := basic * (1 + rate)
		return final
#近战攻击
var melee:float:
	get:
		var basic := strength * 3 + agility * 2 + skill_attr.melee + equip_attr.melee + buff_attr.melee
		var rate  := skill_attr.melee_rate + equip_attr.melee_rate + buff_attr.melee_rate
		var final := basic * (1 + rate)
		return final
#远程攻击
var ranged:float:
	get:
		var basic := agility * 3 + strength * 2 + skill_attr.ranged + equip_attr.ranged + buff_attr.ranged 
		var rate  := skill_attr.ranged_rate + equip_attr.ranged_rate + buff_attr.ranged_rate
		var final := basic * (1 + rate)
		return final
#破甲能力
var armorpen:float:
	get:
		var basic := skill_attr.armorpen + equip_attr.armorpen + buff_attr.armorpen 
		var rate  := skill_attr.armorpen_rate + equip_attr.armorpen_rate + buff_attr.armorpen_rate 
		var final := basic * (1 + rate)
		return min(final,30000)
#暴击率
var critical:float:
	get:
		var basic := skill_attr.critical + equip_attr.critical + buff_attr.critical 
		var rate  := skill_attr.critical_rate + equip_attr.critical_rate + buff_attr.critical_rate 
		var final := basic * (1 + rate)
		return final
#最低武器伤害 这两项需要单独赋值
var mix_weapon_damage :float:
	get:
		return 0.0
#最高武器伤害
var max_weapon_damage :float:
	get:
		return 0.0
#元素命中
var elehit:float:
	get:
		var basic := 100 + skill_attr.elehit + equip_attr.elehit + buff_attr.elehit 
		var rate  := skill_attr.elehit_rate + equip_attr.elehit_rate + buff_attr.elehit_rate
		var final := basic * (1 + rate)
		return final
#诅咒命中
var curhit:float:
	get:
		var basic := 100 + skill_attr.curhit + equip_attr.curhit + buff_attr.curhit 
		var rate  := skill_attr.curhit_rate + equip_attr.curhit_rate + buff_attr.curhit_rate
		var final := basic * (1 + rate)
		return final
#魔法攻击
var magic:float:
	get:
		var basic := intellect * 1.5 + perception + skill_attr.magic + equip_attr.magic + buff_attr.magic
		var rate  := skill_attr.magic_rate + equip_attr.magic_rate + buff_attr.magic_rate
		var final := basic * (1 + rate)
		return final
#魔法穿透
var magic_pen:float:
	get:
		var basic := skill_attr.magic_pen + equip_attr.magic_pen + buff_attr.magic_pen 
		var rate  := skill_attr.magic_pen_rate + equip_attr.magic_pen_rate + buff_attr.magic_pen_rate 
		var final := basic * (1 + rate)
		return min(final,500)

# 高级属性 攻击属性 结束__________________________________________


# 高级属性 防御属性 开始_________________________________________
#近战防御
var melee_def:float:
	get:
		var basic := constitution * 10 + dexterity * 5 + skill_attr.melee_def + equip_attr.melee_def + buff_attr.melee_def
		var rate  := skill_attr.melee_def_rate + equip_attr.melee_def_rate + buff_attr.melee_def_rate
		var final := basic * (1 + rate)
		return final
#远程防御
var ranged_def:float:
	get:
		var basic := dexterity * 10 + perception * 5 + skill_attr.ranged_def + equip_attr.ranged_def + buff_attr.ranged_def
		var rate  := skill_attr.ranged_def_rate + equip_attr.ranged_def_rate + buff_attr.ranged_def_rate
		var final := basic * (1 + rate)
		return final
#护甲 只有装备有影响
var armor:float: 
	get:
		return equip_attr.armor
#闪避
var dodge:float:
	get:
		var basic :=(agility + dexterity) / 3 + skill_attr.dodge + equip_attr.dodge + buff_attr.dodge
		var rate  := skill_attr.dodge_rate + equip_attr.dodge_rate + buff_attr.dodge_rate
		var final := basic * (1 + rate)
		return final
#魔法防御
var magic_def:float:
	get:
		var basic := intellect + perception * 2 + skill_attr.magic_def + equip_attr.magic_def + buff_attr.magic_def
		var rate  := skill_attr.magic_def_rate + equip_attr.magic_def_rate + buff_attr.magic_def_rate
		var final := basic * (1 + rate)
		return final
#元素魔法抗性
var ele_resist:float:
	get:
		var basic := magic_def / 7 + skill_attr.ele_resist + equip_attr.ele_resist + buff_attr.ele_resist
		var rate  := skill_attr.ele_resist_rate + equip_attr.ele_resist_rate + buff_attr.ele_resist_rate
		var final := basic * (1 + rate)
		return final
#诅咒魔法抗性
var cur_resisit:float:
	get:
		var basic := magic_def / 8 + skill_attr.cur_resisit + equip_attr.cur_resisit + buff_attr.cur_resisit
		var rate  := skill_attr.cur_resisit_rate + equip_attr.cur_resisit_rate + buff_attr.cur_resisit_rate
		var final := basic * (1 + rate)
		return final
#韧性
var resilience:float:
	get:
		var basic := skill_attr.resilience + equip_attr.resilience + buff_attr.resilience
		var rate  := skill_attr.resilience_rate + equip_attr.resilience_rate + buff_attr.resilience_rate
		var final := basic * (1 + rate)
		return min(final,700)
# 高级属性 防御属性 结束_________________________________________



#基础属性 类
class BaseAttribute:
	var strength : float
	var constitution :float
	var agility :float
	var dexterity:float
	var intellect:float
	var perception:float
	
	func _init(_data:Dictionary) -> void:
		if _data == {}:
			return
		strength     = _data["strength"]
		constitution = _data["constitution"]
		agility      = _data["agility"]
		dexterity    = _data["dexterity"]
		intellect    = _data["intellect"]
		perception   = _data["perception"]
		
#高级属性 类
class AdvancedAttributes:
	
	var health : float  
	var health_rate : float

	var mana   : float
	var mana_rate :float

	var strength : float
	var strength_rate :float
	var constitution :float
	var constitution_rate:float
	var agility :float
	var agility_rate:float
	var dexterity:float
	var dexterity_rate:float
	var intellect:float
	var intellect_rate:float
	var perception:float
	var perception_rate:float

	var speed: float
	var speed_rate:float
	var phyhit:float
	var phyhit_rate:float
	var melee:float
	var melee_rate:float
	var ranged:float
	var ranged_rate:float
	var armorpen:float
	var armorpen_rate:float
	var phyhit_offset:float = 0		#物理强命
	var phy_to_hp:float
	var critical:float
	var critical_rate:float
	var critical_offset:float = 0.0		#暴击伤害值

	var mix_weapon_damage:float
	var max_weapon_damage:float
	var sword_attack_rate:float			#剑类武器
	var axe_attack_rate:float			#斧类武器
	var shield_attack_rate:float		#盾牌类武器
	var polearm_attack_rate:float		#长柄武器
	var sabre_attack_rate:float			#刀类
	var bareknuckle_attack_rate:float	#肉搏伤害
	var bow_attack_rate:float			#弓箭类武器

	var elehit :float
	var elehit_rate :float
	var curhit :float
	var curhit_rate :float
	var magic:float
	var magic_rate:float
	var magic_pen:float
	var magic_pen_rate:float
	var magic_offset:float = 0.0		#魔法强命
	var hit_debuff:float = 0
	var reflect :float

	var melee_def:float
	var melee_def_rate:float
	var ranged_def:float
	var ranged_def_rate:float
	var armor:float
	var armor_rate:float
	var dodge:float
	var dodge_rate:float
	var magic_def:float
	var magic_def_rate:float
	var ele_resist:float
	var ele_resist_rate:float
	var cur_resisit:float
	var cur_resisit_rate:float
	var resilience:float
	var resilience_rate:float
