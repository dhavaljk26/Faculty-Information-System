json.extract! project, :id, :title, :description, :funding_agency, :fund_amount, :due_date, :other_contributors, :created_at, :updated_at
json.url project_url(project, format: :json)
