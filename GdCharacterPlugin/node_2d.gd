extends Node2D


func _ready() -> void:
	var dic := {
		"experience":50,
		"nick_name":"万寿山",
		"prefab":"",
		"cur_health":100,
		"cur_mana":40,
		"base_attr":{},
		
	}
	var cc := PlayerCharacter.new(dic)
	add_child(cc)
