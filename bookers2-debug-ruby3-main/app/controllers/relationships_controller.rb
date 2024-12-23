class RelationshipsController < ApplicationController
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    
  end
  
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer 
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  private
  def set_user
    user = User.find(params[:id])
  end
end
