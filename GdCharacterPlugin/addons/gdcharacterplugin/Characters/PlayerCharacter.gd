extends Characters
class_name PlayerCharacter

#使用技能
func select_skill(index:int) -> void:
	
	return

#最大生命值
func get_max_health() -> float:
	var basic = 100 + (level-1)*20 + attribute.strength*3 + attribute.constitution*5 + attribute.skill_attr.health + attribute.equip_attr.health
	var rate  = attribute.skill_attr.health_rate + attribute.equip_attr.health_rate
	var final = basic * (1 + rate)
	return min(final,60000)

#最大魔法值 
func get_max_mana() -> float:
	var basic = 40 + (level-1)*5 + attribute.perception*3 + attribute.intellect*5 + attribute.skill_attr.mana + attribute.equip_attr.mana
	var rate  = attribute.skill_attr.mana_rate + attribute.equip_attr.mana_rate
	var final = basic * (1 + rate)
	return min(final,35000)
