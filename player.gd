extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var current_animation: AnimatedSprite2D


func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())


func _ready() -> void:
	if !is_multiplayer_authority():
		return
	current_animation = $animaciones1

func _physics_process(delta: float) -> void:

	if !is_multiplayer_authority():
		return
	var direction := Input.get_vector("a", "d", "w", "s")
	if direction:
		velocity = direction * SPEED
		current_animation.play("walk")
		if direction.x > 0:
			current_animation.flip_h = false
		else:
			current_animation.flip_h = true
	else:
		current_animation.play("default")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
