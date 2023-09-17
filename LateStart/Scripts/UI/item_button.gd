class_name ItemButton extends TextureButton


@export var required: StringName = ""


func _init():
	mouse_entered.connect(_on_mouse_entered)


func _on_mouse_entered() -> void:
	var enable = _get_held_item() == required
	disabled = not enable
	mouse_filter = Control.MOUSE_FILTER_STOP if enable else Control.MOUSE_FILTER_PASS


func _get_held_item() -> StringName:
	var ui := get_tree().current_scene as UI
	return ui.held_item if ui else ""
