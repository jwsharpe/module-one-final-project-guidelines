def run_program
  greeting # greet msg
  @@user = login # return user
  privacy_setting = project_groups # return string e.i. "private"
  drawings = list_project(privacy_setting) # return array of drawing
  drawing = select_project(drawings, privacy_setting) # return a selected drawing
  list_drawing_setting(drawing)
end


