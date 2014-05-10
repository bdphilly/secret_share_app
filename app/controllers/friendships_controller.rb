class FriendshipsController < ApplicationController
  def create
    sleep(1)
    # new_friendship = Friendship.new(
    #   in_friend_id: params[:user_id],
    #   out_friend_id: current_user.id
    # )
    #
    # if new_friendship.save
    #   render json: new_friendship.to_json
    # else
    #   render json: 'not okay', status: 422
    #
    # end
  end

  def destroy
    sleep(1)

    # no_longer_friends = Friendship.find_by(
    #   in_friend_id: params[:friendship][:in_friend_id],
    #   out_friend_id: current_user.id
    # )
    #
    # no_longer_friends.delete
    #
    # flash[:errors] = no_longer_friends.errors.full_messages
    # render json: {}
  end

  private

  def friendship_params
    params.require(:friendship).permit(:in_friend_id)
  end
end
