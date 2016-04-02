class PagesController < ApplicationController
  def home
  	@articles = Article.all.sort_by(&:score).reverse
  end

  def about
  end
  
end
