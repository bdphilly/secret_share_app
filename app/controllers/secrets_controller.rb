class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @secret.recipient_id = params[:user_id]

    render :new
  end

  def create
    @secret = current_user.authored_secrets.new(secret_params)

    if @secret.save
      render :json => @secret, :head => :ok
    else
      render :new
    end
  end

  private

  def secret_params
    params.require(:secret).permit(:title, :recipient_id)
  end
end
