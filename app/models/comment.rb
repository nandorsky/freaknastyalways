class Comment < ActiveRecord::Base
  #Validations
  validates :comment, presence: true

  #Assocations
  belongs_to :user
  belongs_to :article
  
end
