## Model Relationships
* user model 
  * has many user drawings
* user_drawing model
  * belongs to user
  * belongs to drawing
* drawing model
  * has many user_drawing
  * has many shape
* shape model
  * belongs to drawing

---
* drawing
  * title
  * can be public or private
---

* user
  * self.check_exists?(user)
  * #private_drawings
  * #public_drawings
* cli
  * #display_projects
  * #display_settings
    * open project
    * delete project