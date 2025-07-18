extends Area2D

const COOLDOWN = 2.0
const BURST_COUNT = 4
const BURST_DELAY = 0.1
var shots_fired = 0
func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_transform = %ShootingPoint.global_transform
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shots_fired = 0
	shoot()
	if BURST_COUNT > 1:
		%BurstTimer.start(BURST_DELAY)


func _on_burst_timer_timeout() -> void:
	shots_fired += 1
	if shots_fired < BURST_COUNT:
		shoot()
		%BurstTimer.start(BURST_DELAY)
	else:
		%BurstTimer.stop()
		%Timer.start(COOLDOWN)
