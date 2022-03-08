class Friend < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :profile, optional: true

  validates_uniqueness_of :friend_1_id, scope: :friend_2_id

end