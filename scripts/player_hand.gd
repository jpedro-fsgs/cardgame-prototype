extends Node2D

@onready var card_manager: Node2D = $"../CardManager"
const HAND_COUNT = 7
const CARD_SCENE_PATH = 'res://scenes/card.tscn'
const CARD_WIDTH = 90

var player_hand = []

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#
	#var card_scene = preload(CARD_SCENE_PATH)
	#for i in range(HAND_COUNT):
		#var new_card = card_scene.instantiate()
		#card_manager.add_child(new_card)
		#new_card.name = "Card"
		#add_card_to_hand(new_card)

func add_card_to_hand(card):
	if card not in player_hand:
		player_hand.insert(0, card)
		update_hand_positions()
	else:
		animate_card_to_position(card, card.hand_position)
	
func update_hand_positions():
	for i in range(player_hand.size()):
		var card = player_hand[i]
		var new_position = calculate_card_position(i)
		card.hand_position = new_position
		animate_card_to_position(card, new_position)

func calculate_card_position(index):
	var spacing = 100
	var screen_size = get_viewport_rect().size
	var total_width = (player_hand.size() - 1) * CARD_WIDTH
	return Vector2(screen_size.x*0.5 + CARD_WIDTH * index - total_width*0.5, screen_size.y * 0.85)
	
	
func animate_card_to_position(card, position):
	var tween = get_tree().create_tween()
	tween.tween_property(card, "position",position, 0.4)
	#card.position = position
# Called every frame. 'delta' is the elapsed time since the previous frame.

func remove_card_from_hand(card):
	player_hand.erase(card)
	

func _process(_delta: float) -> void:
	pass
