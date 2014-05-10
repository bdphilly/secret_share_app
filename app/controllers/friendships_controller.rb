class FriendshipsController < ApplicationController
  def create
    sleep(1)
    new_friendship = Friendship.new(
      out_friend_id:params[:user_id],
      in_friend_id: current_user.id
    )

    if new_friendship.save
      render json: new_friendship.id
    else
      render json:  new_friendship.errors.full_messages, status: 422
    end
  end

  def destroy
    sleep(1)

    no_longer_friends = Friendship.find(params[:id])
    no_longer_friends.delete

    render json: {}
  end

  private

  def friendship_params
    params.require(:friendship).permit(:in_friend_id)
  end
end
