extends Node

const SCROLL_SPEED : float = 120.0
const IMG_W : float = 1920.0
const IMG_H : float = 1080.0

var game_over : bool = false
@onready var menu_scene = preload("res://scenes/menu/main_menu.tscn")
@onready var game_scene = preload("res://scenes/game/game.tscn")

func _ready() -> void:
    pass
    
func start_game():
    get_tree().change_scene_to_packed(game_scene)


func change_scene_to_main():
    get_tree().change_scene_to_packed(menu_scene)

