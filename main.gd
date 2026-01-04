extends Node2D

var pet_count = 0
var happy_birthday = false
const cat_petted = preload("res://Images and Sounds/cat_petted.png")


func _on_button_pressed() -> void:
	pet_count += 1
	$Cat.frame = 1
	
	if pet_count > 9 or happy_birthday:
		explode()
	
	if pet_count < 10:
		$Sounds/Meow.play()
	await get_tree().create_timer(0.5).timeout
	$Cat.frame = 0

# ending 1 petted cat
func explode():
	$Cat/Button.hide()
	$Sounds/CatScream.play()
	$Sounds/Music1.stop()
	$Explode.show()
	$"Sounds/ExplodeSound".play()
	$AnimationPlayer/Hat.hide()
	$AnimationPlayer/Fireworks.hide()
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()

# ending 2 and 3 happy cat
func _on_nd_ending_timeout() -> void:
	$Sounds/Music1.stop()
	$Cat/Button.hide()
	$AnimationPlayer.play("RESET")
	await get_tree().create_timer(5).timeout
	$Sounds/Meow.play()
	$Cat.frame = 1
	$Sounds/Music2.play()
	$Title.text = "Happy Birthday James!"
	happy_birthday = true
	$Cat/Button.show()
