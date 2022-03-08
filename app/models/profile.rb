class Profile < ApplicationRecord
  belongs_to :User
  has_many :posts
  has_many :friends
end
