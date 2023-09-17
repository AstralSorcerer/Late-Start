class_name Inventory extends HBoxContainer


signal item_added(item: InventoryItem)
signal item_removed(item: InventoryItem)


func get_item(id: StringName) -> InventoryItem:
	var items := get_children().filter(func (node: Node) -> bool:
		var item := node as InventoryItem
		return item.id == id if item else false)
	
	return items[0] if items.size() > 0 else null


func add_item(item: InventoryItem) -> bool:
	if not get_item(item.id):
		add_child(item)
		return true
	else:
		return false


func remove_item(id: StringName) -> bool:
	var item := get_item(id)
	if item:
		remove_child(item)
		item_removed.emit(item)
		return true
	else:
		return false


func _on_child_entered_tree(node: Node) -> void:
	var item := node as InventoryItem
	if item:
		item_added.emit(item)
