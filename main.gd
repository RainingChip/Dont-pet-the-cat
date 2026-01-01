extends Node2D

var pet_count = 0


func _on_button_pressed() -> void:
	
	pet_count += 1
	$Cat.frame = 1
	print(pet_count)
	
	if pet_count > 9:
		explode()
	
	if pet_count < 10:
		$Sounds/Meow.play()
	await get_tree().create_timer(0.5).timeout
	$Cat.frame = 0
	


func explode():
	$Cat/Button.hide()
	$Sounds/CatScream.play()
	$Sounds/Music.stop()
	$Explode.show()
	$"Sounds/ExplodeSound".play()
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()
