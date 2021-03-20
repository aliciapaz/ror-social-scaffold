class FriendshipsController < ApplicationController
  def create
    @requester = current_user
    @friendship = @requester.friendships.build(requestee_id: friendship_params[:requestee_id])

    if @friendship.save
      redirect_to users_path
      flash.notice = 'Friendship request sucesffully sent'
    else
      redirect_to posts_path
      flash.alert = 'Friendship request unsuccessful'
    end
  end

  def show; end

  def update
    @friendship = Friendship.find(friendship_update_params[:id])

    if @friendship.update(friendship_update_params)
      redirect_to users_path
      flash.notice = 'Friendship successfully updated'
    else
      redirect_to posts_path
      flash.alert = 'Friendship update unsuccessful'
    end
  end

  def destroy; end

  private

  def friendship_params
    params.require(:friendship).permit(:requestee_id)
  end

  def friendship_update_params
    params.require(:friendship).permit(:id, :status)
  end
end
