extends TextureButton

@export var item_type: String
var CURSOR_ITEM

func _ready() -> void:
	CURSOR_ITEM = get_tree().get_first_node_in_group("CursorItem")

func _on_mouse_entered() -> void:
	CURSOR_ITEM.enter(item_type)

func _on_mouse_exited() -> void:
	CURSOR_ITEM.exit(item_type)

func _on_pressed() -> void:
	GameState.unpause()
	visible = false
	CURSOR_ITEM.exit(item_type)
