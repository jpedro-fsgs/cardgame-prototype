extends Node2D

var cards_in_slot = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func add_to_slot(card):
	cards_in_slot.append(card)
	
	print(cards_in_slot)
