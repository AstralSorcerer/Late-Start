extends TextureButton

func Play():
	get_tree().change_scene_to_file("res://Scenes/LivingRoom.tscn");

func Quit():
	get_tree().quit();

func DiningRoom():
	get_tree().change_scene_to_file("res://Scenes/DiningRoom.tscn");

func TopDrawer():
	var pipe = preload("res://Assets/LivingRoom/DrawerOpen.png");
	var textBox = get_node("/root/Main/TextBox");
	textBox.Appear();

func Scissors():
	# get_node("/root/Rope").set_disabled(false);
	#No matter what I do, I can't figure out how to access another object!
