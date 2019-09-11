* Drawing Settings
  * Public
    * Check Owner
  * Collab
    * Check Owner
    * Add collabortaor should not have self.username
  * Private
    * Add collaborator Should not have self.username

* Create Scene Class
  * login_scene = Scene.new(:login, session)
  * project_group_scene = Scene.new(:project_groups, session)
  * scene_manager = SceneManager.new([login_scene, project_group_scene])
  * when login_scene returns "DONE"
    * SceneManager.next

