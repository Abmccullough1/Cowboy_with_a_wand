extends CharacterBody2D



var health = 50
var invi = false

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	print(health)
	update_healthbar()
func update_healthbar():
	var health_bar = $Bosshealth
	health_bar.value = health
	
func take_arrow_damage():
	if health > 0 :
		health-=10
func take_super_arrow_damage():
	if health> 0 :
		health -= 50
func death():
	if health < 0 or health == 0:
		$Boss_music.stop()
		$victory.play()
		await get_tree().create_timer(30.0).timeout
		queue_free()
func _on_tumbletweed_area_entered(area):
	if  area.name == "Arrow":
		take_arrow_damage()
	if area.name == "super_arrow":
		take_super_arrow_damage()
	death()





	


func _on_bossmusic_area_entered(area):
	$Boss_music.play()
# Replace with function body.


func _on_bossmusic_area_exited(area):
	$Boss_music.stop()
