extends VideoStreamPlayer

@export var secondVideo: VideoStreamPlayer

func _process(delta):
	if (!is_playing() && !paused):
		if (secondVideo == null):
			get_tree().change_scene_to_file("res://Scenes/Main UI.tscn");
		else:
			secondVideo.play()
			secondVideo.paused = false
			queue_free()



