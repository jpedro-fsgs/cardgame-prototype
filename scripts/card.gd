extends Node2D

signal hovered
signal hovered_off

@onready var card_texture: Sprite2D = $CardTexture

var number
var color
var wild

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func set_card(card):
	card_texture.texture = load(card["path"])
	name = card["name"]
	if card["color"] == "wild":
		number = null
		color = "wild"
		wild = true
	else:
		number = card["number"]
		color = card["color"]
		wild = false
		
func get_card_data():
	return {
		"name": name,
		"number": number,
		"color": color,
		"wild": wild
	}

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
