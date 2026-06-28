extends CharacterBody2D

# Velocidad a la que se moverá tu personaje
@export var speed = 150 

# Referencia al nodo de las animaciones
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Obtenemos la dirección basada en las teclas presionadas
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Aplicamos el movimiento
	velocity = direction * speed
	move_and_slide()
	
	# Control de las animaciones
	if direction.length() > 0:
		if direction.x > 0:
			animated_sprite.play("derecha") 
		elif direction.x < 0:
			animated_sprite.play("izquerda")
		elif direction.y > 0:
			animated_sprite.play("bajar")
		elif direction.y < 0:
			animated_sprite.play("subir")
	else:
		# Si no se está moviendo, detenemos la animación (o puedes poner una de "reposo")
		animated_sprite.stop()
