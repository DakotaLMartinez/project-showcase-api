class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  def update
    current_user.update!(user_params)
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  private

  def user_params
    params.permit(:avatar, :purge_avatar, :name, :email, :hide_email, :linkedin_url, :github_url, :twitter_url)
  end
end
