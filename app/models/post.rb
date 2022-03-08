class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :profile, optional: true
end
