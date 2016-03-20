json.array!(@posts) do |post|
  json.extract! post, :id, :title, :url, :description, :type
  json.url post_url(post, format: :json)
end
