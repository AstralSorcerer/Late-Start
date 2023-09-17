extends Panel

@onready var label = $Label
@onready var textFinal = "This is some text."
@onready var textFinished = false
@onready var processTimer = 0
@onready var textScrollTime = .02
@onready var textLinesGlobal = []
@onready var currentTextLine = 0


func _ready():
	receivedText(["This is the first line", "And this is the second"]);
	
func _process(delta):
	processTimer += delta
	if (processTimer > textScrollTime && !textFinished):
		label.text = label.text + textFinal[label.text.length()]
		processTimer = 0
		if (label.text.length() == textFinal.length()):
			textFinished = true
	if ((Input.is_action_pressed("MouseClick") || Input.is_action_just_released("SpaceBar")) && textFinished):
		if (currentTextLine != textLinesGlobal.size() - 1):
			processTimer = 0
			currentTextLine += 1
			textFinal = textLinesGlobal[currentTextLine]
			label.text = ""
			textFinished = false
		else:
			self.visible = false

func receivedText(textLines: Array):
	textFinal = textLines[0]
	processTimer = 0
	currentTextLine = 0
	textLinesGlobal = textLines
	self.visible = true
	
