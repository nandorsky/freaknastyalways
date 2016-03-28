class Article < ActiveRecord::Base
	#Validations
	validates :title, presence: true
	validates :url, presence: true

	#Assocations
	belongs_to :user
	has_many :comments
end
