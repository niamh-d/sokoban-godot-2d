extends Node

const LEVEL_DATA_PATH: String = "res://data/level_data.json"
const TILE_SIZE: int = 32

var _level_data: Dictionary = {} # level: LevelLayout

func _ready() -> void:
	load_level_data()

func setup_level(raw_level_data: Dictionary) -> LevelLayout:
	var layout: LevelLayout = LevelLayout.new()
	
	var ps = raw_level_data.player_start
	layout.set_player_start(ps.x, ps.y)
	
	return layout

func load_level_data() -> void:
	var file = FileAccess.open(LEVEL_DATA_PATH, FileAccess.READ)
	var raw_data = JSON.parse_string(file.get_as_text())
	
	for lns in raw_data.keys():
		var new_lvl_layout: LevelLayout = setup_level(raw_data[lns])
		_level_data[lns] = new_lvl_layout
