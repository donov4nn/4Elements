extends Node2D

@onready var _lines = $Lines
@export var max_length = 200

#var _pressed = false
var _current_line: Line2D
var _base_pos

func _input(event: InputEvent):
	if Input.is_action_just_pressed("draw"):
		if not _current_line == null:
			_lines.remove_child(_current_line)
		_base_pos = get_pos(event)
		_current_line = Line2D.new()
		_current_line.default_color = Color.BLACK
		_current_line.width = 8.0
		_lines.add_child(_current_line)
	
	if Input.is_action_pressed("draw") and line_width_is_good():
		_current_line.add_point(get_pos(event))

func line_width_is_good():
	## comparer max_length ici et return true ou false selon la longueur de la ligne
	return true

func get_pos(event):
	return event.position if event is InputEventScreenTouch else get_local_mouse_position()
