class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    @requestee_friends = Friendship.where(requester_id: current_user, status: 'accepted').pluck(:requestee_id)
    @requester_friends = Friendship.where(requestee_id: current_user, status: 'accepted').pluck(:requester_id)
    @me_and_friends = @requestee_friends + @requester_friends + [current_user[:id]]
    @timeline_posts ||= Post.where(user_id: @me_and_friends).ordered_by_most_recent.includes(:user)
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
