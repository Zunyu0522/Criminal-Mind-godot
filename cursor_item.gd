extends TextureButton

func _process(delta: float) -> void:
	position = get_global_mouse_position()

func enter(item):
	get_node(item).visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func exit(item):
	get_node(item).visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
