json.array!(@articles) do |article|
  json.extract! article, :id, :title, :url, :description, :type_of_article, :user_id
  json.url article_url(article, format: :json)
end
