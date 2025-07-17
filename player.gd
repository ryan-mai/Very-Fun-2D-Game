extends CharacterBody2D

# Update Physics
func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * 600
	move_and_slide()

	if velocity.length() > 0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
