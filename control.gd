extends Control
@onready var gold = $top/TextureRect2/Label
@onready var exp =$top/TextureRect4/Label

@onready var baseAttr = $mid/TextureRect/HBoxContainer

func _init() ->void:
	PlayerData.onPlayerDataChange.connect(self.onPlayerDataChange)
	PlayerData.onPlayerAttrChange.connect(self.onPlayerAttrChange)

# Called when the node enters the scene tree for the first time.
func _ready() ->void:
	PlayerData.loadData()

func onPlayerDataChange():
	gold.text = "%s" %PlayerData.player_data["gold"]
	exp.text = "%s" %PlayerData.player_data["exp"]

func onPlayerAttrChange():
	var keys = PlayerData.player_attr.keys()
	var values = PlayerData.player_attr.values()
	var index = 0
	for label in baseAttr.get_children():
		label.text ="%s : %s" %[ConstUtils.getAttrName(keys[index]),values[index]]
		index+=1
func _process(delta:float)->void:
	pass
