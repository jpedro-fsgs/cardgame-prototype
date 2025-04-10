extends Node2D

const CARD_SCENE_PATH = 'res://scenes/card.tscn'
const CARD_DATABASE_PATH = 'res://scripts/card_database.gd'

@onready var card_manager: Node2D = $"../CardManager"

var deck = []

@onready var area_2d: Area2D = $Area2D

func draw_card(player_hand, amount):
	for i in range(amount):
		if !deck.size():
			return
		deck.shuffle()
		var drawn_card = deck[0]
		deck.remove_at(0)
		
		var card_scene = preload(CARD_SCENE_PATH)
		var new_card = card_scene.instantiate()
		card_manager.add_child(new_card)
		new_card.name = drawn_card.name
		new_card.position = Vector2(296.0, 224.0)
		new_card.scale = Vector2(0.5, 0.5)
		new_card.set_card(drawn_card)
		player_hand.add_card_to_hand(new_card)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deck = CardDatabase.get_cards()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
