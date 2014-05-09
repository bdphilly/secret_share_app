class FriendshipsController < ApplicationController
  def create
    sleep(2)
    new_friendship = Friendship.new(
      in_friend_id: params[:user_id],
      out_friend_id: current_user.id
    )

    if new_friendship.save
      render json: new_friendship.to_json
    else
      render json: 'not okay', status: 422

    end
  end

  def destroy
    sleep(2)
    no_longer_friends = Friendship.find(params[:id])

    no_longer_friends.delete
    flash[:errors] = no_longer_friends.errors.full_messages
    # redirect_to users_url
    render json: {}
  end
end
