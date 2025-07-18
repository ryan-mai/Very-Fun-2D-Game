extends Node2D

func spawn_mob():
	%PathFollow2D.progress_ratio = randf()
	var new_mob = preload("res://enemy.tscn").instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.show()
	get_tree().paused = true
