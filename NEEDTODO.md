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




# CLI MINIMUM DONE
* Collaboration (Higher priority)
  * Need to add collaborators
  * Need to add privacy setting: "collaborate"
  * Add that to project menu
  * Go back to project groups
  * Only owner can delete collaborative work
  * 

* Go backwards in menu feature.
  * Go back to start
  * (stretch goal) If user types in '..' it'll go back one level.
  
* user_drawing
  * delete name variable when possible

* user
  * User_name sanitation (i.e. pongo && Pongo should be the same)
  * Password implementation

* Colors (Low priority)
  * I really want to add different colors besides red.
  * Refactor the drawing api