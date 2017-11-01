json.extract! course, :id, :name, :credits, :ltp, :course_type, :academic_degree_id, :department_id, :created_at, :updated_at
json.url course_url(course, format: :json)
