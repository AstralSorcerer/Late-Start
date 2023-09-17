class_name InventoryItem extends TextureButton


@export var id: StringName = ""

#var _inventory: Inventory = null


#func _enter_tree() -> void:
#	if get_parent() is Inventory:
#		_inventory = null
#	else:
#		_inventory = get_tree().current_scene.get_node("Inventory")


func _pressed():
	var top := get_tree().current_scene
	var inventory = top.get_node("Inventory")
	if get_parent() == inventory:
		var ui := get_tree().current_scene as UI
		if ui:
			ui.held_item = id
			Input.set_custom_mouse_cursor(self.texture_normal)
	elif inventory:
		get_parent().remove_child(self)
		inventory.add_item(self)
		


#func _get_drag_data(_at_position: Vector2) -> Variant:
#	if not _inventory:
#		set_drag_preview(_as_simple_texture())
#		return id
#	else:
#		return null
#
#
#func _as_simple_texture() -> Control:
#	var texture := TextureRect.new()
#	texture.texture = self.texture_normal
#	texture.set_position(-self.size / 2)
#	var node := Control.new()
#	node.add_child(texture)
#	return node
