extends Node

var max_player_health = 10000
var player_health = max_player_health
var player_attack = 1000
var max_enemy_health = 8000
var enemy_health = max_enemy_health
var enemy_attack = 1000
var is_player_turn = true


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if player_health && enemy_health:
#		if is_player_turn:
#			enemy_health -= player_attack
#		else:
#			player_health -= enemy_attack
#		is_player_turn = !is_player_turn
	pass


func _on_timer_timeout():
	if player_health > 0 && enemy_health > 0:
		if is_player_turn:
			var chance = randi() % 10
			if chance <= 2:
				# 30% crit chance
				enemy_health -= 2 * player_attack
				$"../ProgressBar_enemy".value = float(enemy_health) / max_enemy_health * 100
				$"../attack_enemy".set_visible(true)
				$"../attack_enemy".play("crit")
			else:
				# default attack
				enemy_health -= player_attack
				$"../ProgressBar_enemy".value = float(enemy_health) / max_enemy_health * 100
				$"../attack_enemy".set_visible(true)
				$"../attack_enemy".play("default")
		else:
			player_health -= enemy_attack
			$"../ProgressBar_player".value = float(player_health) / max_player_health * 100
			$"../attack_player".set_visible(true)
			$"../attack_player".play()
		is_player_turn = !is_player_turn
		var text = "player: " + str(player_health) + " enemy: " + str(enemy_health)
		print(text)


func _on_attack_player_animation_finished():
	$"../attack_player".set_visible(false)


func _on_attack_enemy_animation_finished():
	$"../attack_enemy".set_visible(false)
