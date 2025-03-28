extends Node2D

@onready var player_hand: Node2D = $"../PlayerHand"

#const COLLISION_MASK_CARD = 1
const COLLISION_MASK_CARD_SLOT = 2

var screen_size
var card_being_dragged
var is_hovering_on_card

#func connect_card_signals(card):
	#card.connect("hovered", on_hovered_card)
	#card.connect("hovered_off", on_hovered_off_card)

#func on_hovered_card(card):
	#if card_being_dragged:
		#return
	#if not is_hovering_on_card:
		#is_hovering_on_card = true
		#highlight_card(card, true)
	
#func on_hovered_off_card(card):
	#if card_being_dragged:
		#return
	#highlight_card(card, false)
	#var new_card_hovered = raycast_check_for_card()
	#if new_card_hovered:
		#highlight_card(new_card_hovered, true)
	#else:
		#is_hovering_on_card = false
	
#func highlight_card(card, hovered):
	#if hovered:
		#card.scale = Vector2(0.55, 0.55)
		#card.z_index = 2
	#else:
		#card.scale = Vector2(0.5, 0.5)
		#card.z_index = 1
		#is_hovering_on_card = false

func start_drag(card):
	card_being_dragged = card
	card.scale = Vector2(0.45, 0.45)
	
func finish_drag():
	if card_being_dragged:
		card_being_dragged.scale = Vector2(0.5, 0.5)
		var card_slot_found = raycast_check_for_card_slot()
		if card_slot_found:
			if card_slot_found.add_to_slot(card_being_dragged):
				player_hand.remove_card_from_hand(card_being_dragged)
		
		player_hand.update_hand_positions()
		
	card_being_dragged = null
	
func raycast_check_for_card_slot():
	var space_state = get_world_2d().direct_space_state
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	parameters.collide_with_areas = true
	parameters.collision_mask = COLLISION_MASK_CARD_SLOT
	var result = space_state.intersect_point(parameters)
	if result.size() > 0:
		return result[0].collider.get_parent()
	return null
	

func get_card_with_highest_z_index(cards):
	var highest_z_index = -9999
	var return_card
	for card in cards.map(func(card): return card.collider.get_parent()):
		if card.z_index > highest_z_index:
			return_card = card
			highest_z_index = card.z_index
	return return_card

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if card_being_dragged:
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = Vector2(
			clamp(mouse_pos.x, 0, screen_size.x),
			clamp(mouse_pos.y, 0, screen_size.y)
			)
