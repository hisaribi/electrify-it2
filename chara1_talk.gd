extends Area2D

var can_interact = false

func _on_chara1_talk_body_entered(body):
	if body.name == "IgorUgor":
		$Label.show()
		can_interact = true

func _on_chara1_talk_body_exited(body):
	if body.name == "IgorUgor":
		$Label.hide()
		can_interact = false
		$Label.text = "Поговорить"

func _input(chara1_talk):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		$Label.show()
		$Label.text = "За работу"


#func _on_koshey_ready():
#	if Input.is_action_just_pressed("interact") and can_interact == true:
#		$kosheynot.show()
