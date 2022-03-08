class ProfilesController < ApplicationController
  #before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_profile, only: [:show]

  def index
    @profiles = User.where.not(id:current_user.id)
    friends_ids = Friend.where(friend_1_id: current_user.id).map(&:friend_2_id)
    friends_ids << current_user.id

    @friends_post = Post.includes(:user).where(user_id: friends_ids)
    @fe = User.where(id: friends_ids).where.not(id:current_user.id)
  end

  def show
  end

  def follow_account
    account_id = params[:follow_id]
    if Friend.create!(friend_1_id: current_user.id, friend_2_id: account_id)
      flash[:success] = 'Friend Added!'
    else
      flash[:danger] = 'Unable to add friend!'
    end
    redirect_to profiles_path
  end

  def set_profile
    @profile = User.find_by_id(params[:user_id])
  end


  private
end