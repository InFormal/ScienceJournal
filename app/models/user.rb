class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :user_type, :email, :password, :password_confirmation, :remember_me
  validates :name, presence: true, uniqueness: true
  validates :user_type, presence: true
  # attr_accessible :title, :body
  has_and_belongs_to_many :roles

  def role?(role)
    self.roles.where(name: role.to_s.camelcase)
  end
end
