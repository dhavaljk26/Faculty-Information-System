json.extract! publication, :id, :title, :journal, :publisher, :publish_date, :other_contributors, :created_at, :updated_at
json.url publication_url(publication, format: :json)
