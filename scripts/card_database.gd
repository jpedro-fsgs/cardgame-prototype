extends Node

const BASE_PATH = 'res://Card Asset/Uno/individual'

const CARDS_BASE = {
	"colors": ["blue", "green", "red", "yellow"],
	"cards": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "2plus", "block", "inverse"],
	"wild": ["4_plus", "wild_card"]
}

var cards = []

func _ready():
	_generate_cards()

func _generate_cards():
	# Adicionando cartas coloridas
	for color in CARDS_BASE["colors"]:
		for card in CARDS_BASE["cards"]:
			cards.append({
				"name": card + '_' + color,
				"number": card,
				"color": color,
				"path": BASE_PATH + '/' + color + '/' + card + '_' + color + '.png'
			})
			cards.append({
				"name": card + '_' + color,
				"number": card,
				"color": color,
				"path": BASE_PATH + '/' + color + '/' + card + '_' + color + '.png'
			})

	# Adicionando cartas curingas
	for card in CARDS_BASE["wild"]:
		for i in range(4):
			cards.append({
				"name": card,
				"color": "wild",
				"path": BASE_PATH + "/wild/" + card + ".png"
			})

func get_cards():
	return cards
