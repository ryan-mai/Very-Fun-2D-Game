extends CharacterBody2D

var speed = randf_range(200, 300)
var health = 4

@onready var player = get_parent().get_node("Player")

func _ready():
	%Slime.play_walk()
	%HealthBar.init_health(health)
	

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	%Slime.play_hurt()
	health -= 1
	%HealthBar.health = health
	
	if health == 0:
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		queue_free()
