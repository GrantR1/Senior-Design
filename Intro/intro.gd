extends AnimationPlayer
@onready var SceneTransitionAnimation = $"../SceneTransitionAnimation/AnimationPlayer";

func _ready():
	SceneTransitionAnimation.get_parent().get_node("ColorRect").color.a = 255;
	SceneTransitionAnimation.play("fade_out");
	await get_tree().create_timer(0.5).timeout;
	play("example");
	await get_tree().create_timer(4.0).timeout;
	play('second-verse');
	await get_tree().create_timer(10.0).timeout;
	play('third-verse');
	await get_tree().create_timer(4.0).timeout;
	SceneTransitionAnimation.play("fade_in");
	await get_tree().create_timer(0.5).timeout;
	get_tree().change_scene_to_file("res://ScenesandScripts/main.tscn");
