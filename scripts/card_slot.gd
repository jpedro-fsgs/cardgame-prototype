extends Node2D

@onready var slot: Sprite2D = $Slot

var cards_in_slot = []
var current_card = null
var current_color = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func is_card_valid(card) -> bool:
	if card.wild or !current_card or !current_color:
		return true
	if card.number == current_card.number:
		return true
	if card.color == current_color:
		return true
	return false
	


func add_to_slot(card) -> bool:
	if !is_card_valid(card):
		return false
	if card.wild:
		# SELECT COLOR
		current_color = null
	else:
		current_color = card.color
	cards_in_slot.append(card)
	card.position = position
	card.get_node("Area2D/CollisionShape2D").disabled = true
	card.move_to_front()
	current_card = card
	return true
