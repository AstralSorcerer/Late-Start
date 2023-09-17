extends TextureButton

func Play():
	get_tree().change_scene_to_file("res://Scenes/Main_UI.tscn");

func Quit():
	get_tree().quit();

func DiningRoom():
	get_tree().change_scene_to_file("res://Scenes/DiningRoom.tscn");

func TopDrawer():
	var wrench = preload("res://Assets/LivingRoom/DrawerOpen.png");
	var textBox = get_parent().get_parent().get_parent().get_child(2) #This should never be done. Why can't I figure out a simpler way???
	textBox.receivedText(["There's a wrench in here?"]);

