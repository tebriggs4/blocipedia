class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  # after_initialize { self.role ||= :standard } DO NOT NEED TO DO THIS IF DO DEFAULT IN DATABASE MIGRATION CREATE
         
  enum role: [:standard, :premium, :admin]
end
