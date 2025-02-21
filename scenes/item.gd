extends TextureButton

@export var item_type: String
var CURSOR_ITEM

func _ready() -> void:
	CURSOR_ITEM = get_tree().get_first_node_in_group("CursorItem")

func _on_mouse_entered() -> void:
	if not CURSOR_ITEM.is_interactable(item_type):
		return
	CURSOR_ITEM.enter(item_type)

func _on_mouse_exited() -> void:
	if not CURSOR_ITEM.is_interactable(item_type):
		return
	CURSOR_ITEM.exit(item_type)

func _on_pressed() -> void:
	if not CURSOR_ITEM.is_interactable(item_type):
		return
	GameState.unpause()
	visible = false
	CURSOR_ITEM.exit(item_type)
