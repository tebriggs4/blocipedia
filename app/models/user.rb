class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :collaborators       
  has_many :wikis, through: :collaborators
         
  enum role: [:standard, :premium, :admin]
end
