class FriendshipsController < ApplicationController
  def create
    new_friendship = Friendship.new(
      in_friend_id: params[:user_id],
      out_friend_id: current_user.id
    )

    if new_friendship.save
      redirect_to users_url
    else
      flash.now[:errors] = new_friendship.errors.full_messages
      redirect_to users_url
    end
  end
end
