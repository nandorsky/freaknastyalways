class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  # Roles       
  belongs_to :role
  before_create :set_default_role

  # Relationships for articles and comments
  has_many :articles,  dependent: :destroy
  has_many :comments,  dependent: :destroy

  acts_as_voter

  #default role
  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end

  # If user :has_one :role_assignment
  def assign_role_after_sign_up  
    create_role_assignment(:role_id => 1)
  end

  # If user :has_many :role_assignments
  def assign_role_after_sign_up  
    role_assignments.create(:role_id => 1)
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

end
