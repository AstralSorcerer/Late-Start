class_name TextBox extends Panel

@onready var label = $Label
var textFinal = ""
var textFinished = true
var timerGoing = false
var processTimer = 0
var textScrollTime = .02
var textLinesGlobal = []
var currentTextLine = 0


func _ready():
	#receivedText(["This is the first line", "And this is the second"]);
	pass

func _process(delta):
	if timerGoing:
		processTimer += delta
	if (processTimer > textScrollTime && !textFinished):
		label.text = label.text + textFinal[label.text.length()]
		processTimer = 0
		if (label.text.length() == textFinal.length()):
			textFinished = true
	if ((Input.is_action_pressed("MouseClick") || Input.is_action_pressed("SpaceBar")) && textFinished):
		if (currentTextLine < textLinesGlobal.size() - 1):
			processTimer = 0
			currentTextLine += 1
			textFinal = textLinesGlobal[currentTextLine]
			label.text = ""
			textFinished = false
		else:
			label.text = ""
			self.visible = false
			timerGoing = false

func receivedText(textLines: Array):
	processTimer = 0
	textFinal = textLines[0]
	timerGoing = true
	currentTextLine = 0
	textLinesGlobal = textLines
	textFinished = false
	self.visible = true
