extends Button

var closedBoxPath := "res://texture/宝箱 (177)_爱给网_aigei_com.png"
var openedBoxPath := "res://texture/宝箱 (178)_爱给网_aigei_com.png"
var equipTextures := [
	"res://texture/props_2003.png",
	"res://texture/props_2006.png",
	"res://texture/props_2010.png",
	"res://texture/props_2013.png",
	"res://texture/props_2017.png",
	"res://texture/props_2018.png",
	"res://texture/props_2019.png"
]
var currentTextureIndex := 0
var isShowingBox := true

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial texture to the box image
	self.icon = load(closedBoxPath)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the mouse is clicked on the TextureRect.
func _on_TextureRect_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if isShowingBox:
			# Switch to the next equipment texture
			currentTextureIndex = randi() % equipTextures.size()
			self.texture = load(equipTextures[currentTextureIndex])
		else:
			# Switch back to the box texture
			self.texture = load(closedBoxPath)
		
		# Toggle the state of isShowingBox variable
		isShowingBox = !isShowingBox



func _on_pressed():
	print(get_button_icon().get_path())
	if get_button_icon().get_path() == closedBoxPath:
		self.icon = load(openedBoxPath)
		
	elif get_button_icon().get_path() == openedBoxPath:
		currentTextureIndex = randi() % equipTextures.size()
		print(currentTextureIndex)
		self.icon = load(equipTextures[currentTextureIndex])
