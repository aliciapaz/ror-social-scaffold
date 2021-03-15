class FriendshipsController < ApplicationController

  def create
    @requester  = current_user
    # pass the @requestee.id from the params
    @friendship = @requester.friendships.build(requestee_id: params[:user_id])

    if @friendship.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
  end
  
  def update
    # change status of friendship
  end

  def destroy
  end

end