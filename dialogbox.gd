extends Control

var dialog = [
	'Как я сказал, я соглашусь подписать постройку ЛЭП через нашу деревню только если согласны остальные.',
	'Но вы, товарищ, ещё не получили согласие всех.',
	'Возвращайтесь с подписями.'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$'idle'.visible = finished
	if Input.is_action_just_pressed('interact'):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1.5, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
