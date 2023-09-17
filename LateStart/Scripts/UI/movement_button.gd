class_name MovementButton extends TextureButton

@export var target: PackedScene


func _pressed():
	var room := get_tree().current_scene.get_node("Room")
	if room:
		room.remove_child(room.get_child(0))
		room.add_child(target.instantiate())
