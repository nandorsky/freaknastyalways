class AdminController < ApplicationController
  def index
  	@articles = Article.all.order('created_at desc')
  	@users = User.all.order('created_at desc')
  	@comments = Comment.all.order('created_at desc')
  end
end
