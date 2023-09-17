extends Panel

func _process(delta):
	self.modulate.a -= delta;
	
func Appear():
	self.modulate.a = 1;
	print("asd");
