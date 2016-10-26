class PagesController < ApplicationController
  def home
  	#@sort_article = Article.all.sort_by(&:score).reverse
  	@articles = Article.all.paginate(:page => params[:page], :per_page => 10)
  
  end

  def about
  end
  
end
