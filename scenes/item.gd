extends TextureButton

@export var item_type: String
@export var destroy_item = false
# Set it to some unique ID to make it self-destruct and remember
@export var self_destruct_id = 0
@export var goto_label: String
var CURSOR_ITEM

func _ready() -> void:
	if GameState.is_self_destruct(self_destruct_id):
		queue_free()
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
	if destroy_item:
		# Not tested
		CURSOR_ITEM.inventory.selected_item.queue_free()
		CURSOR_ITEM.inventory.selected_item = null
	if goto_label:
		GameState.goto_label(goto_label)
	if self_destruct_id:
		GameState.self_destruct(self_destruct_id)
