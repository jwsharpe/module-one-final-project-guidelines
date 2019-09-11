#Create Scene Class

project_group_scene = Scene.new(:project_groups, session)
scene_manager = SceneManager.new

scene_manager.add(login_scene)
scene_manager.add(project_group_scene)

login_scene.run
