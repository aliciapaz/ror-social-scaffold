require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'counts the number of post likes' do
    @user = User.create(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @post = Post.create(user_id: @user.id, content: 'Post!')
    @like = Like.create(post_id: @post.id, user_id: @user.id)
    expect(like_count(@post).is_a?(Integer)).to be true
  end
end
