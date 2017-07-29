class FriendRequestsController < ApplicationController
  before_action :get_friend_request, except: %i[index create]

  def index
    @received = FriendRequest.where(friend: current_user)
    @sent = current_user.friend_requests
  end

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.build(friend: friend)

    if @friend_request.save
      flash[:notice] = 'Friend request sent.'
    else
      flash[:warning] = 'Friend request could not be sent.'
    end
    redirect_to user_path(friend)
  end

  def update
    @friend_request.accept_friend
  end

  def destroy
    @friend_request.destroy
    flash[:warning] = 'Friend request declined.'
    redirect_to user_friend_requests_path(current_user)
  end

  private

  def get_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
