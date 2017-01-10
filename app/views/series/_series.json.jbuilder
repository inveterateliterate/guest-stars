json.extract! series, :id, :series_name, :genre, :summary, :rating, :created_at, :updated_at
json.url series_url(series, format: :json)