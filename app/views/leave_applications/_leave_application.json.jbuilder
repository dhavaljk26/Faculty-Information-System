json.extract! leave_application, :id, :faculty_id, :leaving_date, :no_of_days, :reason, :approved, :created_at, :updated_at
json.url leave_application_url(leave_application, format: :json)
