class User < ApplicationRecord
  # Include default devise modules. Others available are:
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_one :profile
  has_many :friends

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
