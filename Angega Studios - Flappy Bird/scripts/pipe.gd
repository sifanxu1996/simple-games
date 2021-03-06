extends StaticBody2D

onready var right = get_node("right")
onready var camera = utils.get_main_node().get_node("camera")

func _ready():
	set_fixed_process(true)
	add_to_group(game.GROUP_PIPES)

func _fixed_process(delta):
	if camera == null: return
	
	if right.get_global_pos().x <= camera.get_total_pos().x:
		queue_free()