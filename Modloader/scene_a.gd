extends Panel

onready var _texture_rect: TextureRect = $TextureRect
onready var file2 = 'user://modconfig'
onready var pathName = "set up path in modconfig file"

func _ready():
	pathName = load_file(file2)
	$LineEdit.text = pathName
	
	var dir = Directory.new()
	dir.open("user://Mods/")
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.ends_with(".pck"):
			$ItemList.add_item(file)

	dir.list_dir_end()

	pass

func load_file(path):

	var f = File.new()
	f.open(path, File.READ)
	var line = f.get_line()
	f.close()
	return line
	
	
func _on_goto_scene_pressed():
	get_tree().change_scene(pathName)
	pass


func _on_ItemList_item_activated(index):
	ProjectSettings.load_resource_pack("user://Mods/" + $ItemList.get_item_text(index))
	$ItemList.remove_item(index)
	
	pass # Replace with function body.


func _on_ItemList_item_selected(index):
	var image_file_name =  ("user://Mods/" + $ItemList.get_item_text(index) + ".png")
	var image = Image.new()
	image.load(image_file_name)
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	_texture_rect.texture = texture


func _on_Button_pressed():
	$FileDialog.popup()
	pass # Replace with function body.


func _on_FileDialog_file_selected(path):
	$LineEdit.text = path
	pathName = path
	
	pass # Replace with function body.

func _on_LineEdit_text_entered(new_text):
	pathName = $LineEdit.text
	pass # Replace with function body.


	
