extends Node2D

@onready var player_hand: Node2D = $"../PlayerHand"
@onready var opponent_hand: Node2D = $"../OpponentHand"
@onready var deck: Node2D = $"../Deck"


var players: Array
var index = 0
var current_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	players = [player_hand, opponent_hand]
	print(deck)
	if deck:
		for player in players:
			deck.draw_card(player, 7)
	current_player = players[index]

func next_player():
	index += 1
	if index >= players.size():
		index = 0
	current_player = players[index]
	
func update_all_players_hand_position():
	for player in players:
		player.update_hand_positions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
