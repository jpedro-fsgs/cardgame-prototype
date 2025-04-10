extends Node2D

@onready var player_hand: Node2D = $"../PlayerHand"
@onready var game_manager: Node2D = $"../GameManager"


const COLLISION_MASK_CARD_SLOT = 2

var screen_size
var card_being_dragged
var is_hovering_on_card

func start_drag(card):
	card_being_dragged = card
	card.scale = Vector2(0.45, 0.45)
	
func finish_drag():
	if card_being_dragged:
		card_being_dragged.scale = Vector2(0.5, 0.5)
		var card_slot_found = raycast_check_for_card_slot()
		if card_slot_found:
			if card_slot_found.add_to_slot(card_being_dragged):
				game_manager.current_player.remove_card_from_hand(card_being_dragged)
		
		game_manager.update_all_players_hand_position()
		
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
