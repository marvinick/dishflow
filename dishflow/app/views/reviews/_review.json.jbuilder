json.extract! review, :id, :food_id, :public, :private, :properties, :created_at, :updated_at
json.url review_url(review, format: :json)
