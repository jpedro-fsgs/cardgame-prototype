extends Node2D

@onready var card_manager: Node2D = $"../CardManager"
const HAND_COUNT = 7
const CARD_SCENE_PATH = 'res://scenes/card.tscn'
const CARD_WIDTH = 90

var opponent_hand = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func add_card_to_hand(card):
	opponent_hand.insert(0, card)
	update_hand_positions()
	
func update_hand_positions():
	for i in range(opponent_hand.size()):
		var card = opponent_hand[i]
		var new_position = calculate_card_position(i)
		animate_card_to_position(card, new_position)

func calculate_card_position(index):
	var screen_size = get_viewport_rect().size
	var total_width = (opponent_hand.size() - 1) * CARD_WIDTH
	return Vector2(screen_size.x*0.5 + CARD_WIDTH * index - total_width*0.5, screen_size.y * 0.15)
	
	
func animate_card_to_position(card, card_position):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position", card_position, 0.4)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func remove_card_from_hand(card):
	opponent_hand.erase(card)
	

func _process(_delta: float) -> void:
	pass
