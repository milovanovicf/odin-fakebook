class FriendsController < ApplicationController
  def index
    friends_ids = Friend.where(friend_1_id: current_user.id).map(&:friend_2_id)
    friends_ids << current_user.id
    @friends = User.where.not(id: friends_ids).where.not(id:current_user.id)
  end
end