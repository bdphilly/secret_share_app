class SecretsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    user = User.find(params[:user_id])
    new_secret = user.received_secrets.new(secret_params)
    new_secret.author_id = current_user.id

    if user.save
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  private

  def secret_params
    params.require(:secret).permit(:title, :user_id)
  end
end
