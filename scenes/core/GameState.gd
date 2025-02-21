extends Node

func pause():
	Dialogic.paused = true
	for input_blocker in get_tree().get_nodes_in_group("InputBlocker"):
		input_blocker.visible = false
	get_tree().root.get_node("DialogicLayout_DialogicStyle/FullAdvanceInputLayer").visible = false

func unpause():
	for input_blocker in get_tree().get_nodes_in_group("InputBlocker"):
		input_blocker.visible = true
	get_tree().root.get_node("DialogicLayout_DialogicStyle/FullAdvanceInputLayer").visible = true
	Dialogic.paused = false

func goto_label(label: String):
	Dialogic.Jump.jump_to_label(label)

func add_item(item_name: String):
	Inventory.WhichInstance.spawn_item(item_name);
