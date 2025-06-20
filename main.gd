extends Node


@onready var addres = $UI/BoxContainer/VBoxContainer/LineEdit.text

func _on_host_pressed() -> void:
	$ServerManager.CreateServer()
	$UI.hide()
	$Room/Node2D.show()


func _on_join_pressed() -> void:
	$ServerManager.CreateClient(addres)
	$UI.hide()
	$Room/Node2D.show()
