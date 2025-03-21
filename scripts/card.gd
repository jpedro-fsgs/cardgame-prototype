extends Node2D

signal hovered
signal hovered_off

var hand_position

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#get_parent().connect_card_signals(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)
	z_index = 2
	scale = Vector2(0.55, 0.55)

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
	z_index = 1
	scale = Vector2(0.5, 0.5)
