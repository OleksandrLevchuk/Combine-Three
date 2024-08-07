GDPC                �                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn        �      �Ҍu�����Wrq    P   res://.godot/exported/133200997/export-dfbaa3b728ad779f93c7149c2a9a8326-tile.scn�      .      ��{x-�9Sd>�M1
�    ,   res://.godot/global_script_class_cache.cfg  �             9>�ʱ�p�˛OL�7u       res://.godot/uid_cache.bin  �      :       g>��Q<�z�V���}       res://main.tscn.remap   �      a       �J�Sw� ������       res://project.binary       C      ��TY�5wv����       res://tile.tscn.remap   @      a       &��  ����EA�$�    k-pVq"j�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    script/source 	   _bundled    script       PackedScene    res://tile.tscn K"Q���B      local://GDScript_1wurf �         local://GDScript_c442r |         local://GDScript_38kav          local://PackedScene_54go2 �      	   GDScript             main       �  extends Control


var column := [ 2, 1, 2, 2, 1 ] # масив з якого створюватимемо плитки в колонці
var tile_scene := preload("res://tile.tscn") # берем зразок плитки
var GRID_GAP := 10 # відстань між плитками
@onready var GRID_SIZE :int = tile_scene.instantiate().size.x # розмір плиток
@onready var SCREEN_BOTTOM := DisplayServer.window_get_size().y # низ екрана


func _ready(): # тут починається гра
	for i in column.size(): # ідемо циклом по кожному елементі в масиві
		var tile: Button = tile_scene.instantiate() #створює плитку
		tile.text = str( column[i] ) #ставить текст плитки на число з масива
		# задати положення плитки, відступивши 10 пікс зліва і знизу екрана
		tile.position = Vector2( GRID_GAP, SCREEN_BOTTOM - GRID_GAP )
		# відступити вверх на стільки клітинок, який номер в масиві
		tile.position.y -= i * ( GRID_GAP + GRID_SIZE ) 
		add_child( tile ) #додає плитку в дерево об'єктів
 	   GDScript          u   extends Polygon2D


func _ready():
	visible = true


func _process(_delta):
	position = get_global_mouse_position()
 	   GDScript          �   extends Polygon2D


func _process(_delta):
	position = get_global_mouse_position()


func _input(event):
	if event is InputEventMouseButton:
		visible = event.pressed
    PackedScene          	         names "         Main    layout_mode    anchors_preset    script    metadata/_edit_lock_    Control    Button7    visible    cursor    scale    polygon 
   Polygon2D    click    color    	   variants                                                     
      @   @%                A  �@  �@  �@  �@   A              �?  �?  �?�� ?%        ��  ��  ��  ��      ��  �@  ��  �@  ��  �@      �@  �@  �@  �@      �@  ��  �@  ��  �@  ��                   node_count             nodes     >   ��������       ����                                        ���                                       ����         	      
                                    ����         	         	   
   
                         conn_count              conns               node_paths              editable_instances              version             RSRC����s�WovRSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    script/source 	   _bundled    script           local://GDScript_i7gq5          local://PackedScene_3u2ic �      	   GDScript          �  extends Button
var offset: Vector2
var initial_position: Vector2
@onready var MAX_DESTROY_DISTANCE = size.x


func _ready():
	set_process( false )
	position.y -= size.y


func _process( _delta ):
	position = get_global_mouse_position() - offset
	if position.distance_to(initial_position) > MAX_DESTROY_DISTANCE:
		_on_button_up()


func _on_button_down():
	initial_position = position
	offset = get_global_mouse_position() - position
	set_process( true )


func _on_button_up():
	set_process( false )
	for node in get_tree().get_nodes_in_group("Tiles"):
		if node != self and position.distance_to( node.position ) < MAX_DESTROY_DISTANCE:
			node.queue_free()
			queue_free()
	position = initial_position
    PackedScene          	         names "   
      Button    offset_right    offset_bottom    text    script    Tiles    _on_button_down    button_down    _on_button_up 
   button_up    	   variants            �B      123                 node_count             nodes        ��������        ����                                         conn_count             conns                                         	                       node_paths              editable_instances              version             RSRC�[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
������e٭A�h�[remap]

path="res://.godot/exported/133200997/export-dfbaa3b728ad779f93c7149c2a9a8326-tile.scn"
�ܕ��=?냘߸�list=[]
�zV��n��   �p��#�0t   res://main.tscnK"Q���B   res://tile.tscn��~��ECFG      application/config/name         Combine Three      application/run/main_scene         res://main.tscn    application/config/features(   "         4.1    GL Compatibility    "   display/window/size/viewport_width      �     editor/movie_writer/movie_fileL      D   C:/Users/Me/Desktop/Godot Projects/Combine Three/godot recording.avi#   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility2   rendering/environment/defaults/default_clear_color      	�|>���>�� ?  �?�]̋�m�7�a�k