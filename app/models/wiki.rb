class Wiki < ActiveRecord::Base
    belongs_to :user
    has_many :collaborators
    has_many :users, through: :collaborators
    
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 10 }, presence: true
end
