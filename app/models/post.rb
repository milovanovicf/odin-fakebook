class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end
end
