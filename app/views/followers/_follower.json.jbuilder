json.extract! follower, :id, :followed_id, :follower_id, :type, :created_at, :updated_at
json.url follower_url(follower, format: :json)