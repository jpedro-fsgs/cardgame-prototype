extends Node2D
const CARD_SCENE_PATH = 'res://scenes/card.tscn'
@onready var card_manager: Node2D = $"../CardManager"
@onready var player_hand: Node2D = $"../PlayerHand"

var player_deck = ["Knight", "Knight", "Knight"]
@onready var area_2d: Area2D = $Area2D


func draw_card():
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	card_manager.add_child(new_card)
	new_card.name = "Card"
	
	player_hand.add_card_to_hand(new_card)

	


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(area_2d.collision_mask)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
