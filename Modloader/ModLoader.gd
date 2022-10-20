extends Node
#
var PATH_MODS: String = 'user://mods'
var PATH_MOD_LOADER_CONFIG: String = 'user://modconfig'
var PATH_MOD_LOADER_GAME_SCENE: String

#var sceneDisplayer = 
var sceneDisplayerInstance

func _ready():
	PATH_MOD_LOADER_GAME_SCENE = load_file(PATH_MOD_LOADER_CONFIG)
	if get_tree() != self:
		var packed_scene: PackedScene = load(PATH_MOD_LOADER_GAME_SCENE)
		get_tree().root.add_child(packed_scene.instance())

var scene_path
func _enter_tree():
	get_tree().connect("node_added", self, "_on_node_added")
	
func _on_node_added(node):
	if node.get_parent() == get_tree().root:
		var path = node.filename
		if path and scene_path != path:
			# A new main scene has been instantiated!
			scene_path = path
			new_scene_navigator()
			
func new_scene_navigator():
	if sceneDisplayerInstance == null:
		sceneDisplayerInstance = preload("res://mods/GodotExplorer/SceneNavigator.tscn").instance()
		get_tree().get_root().add_child(sceneDisplayerInstance)
	pass
	
func load_file(path):
	var f = File.new()
	f.open(path, File.READ)
	var line = f.get_line()
	f.close()
	return line
