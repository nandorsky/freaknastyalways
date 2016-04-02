class Article < ActiveRecord::Base
	#Validations
	validates :title, presence: true
	#validates :url, :url => true

	#voting
	acts_as_votable

	#Assocations
	belongs_to :user
	has_many :comments,  dependent: :destroy
  
  def score
  	self.get_upvotes.size 
  end

  def number_of_comments
  	Article.last
  end
end
