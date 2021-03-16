module UserHelper
  def friendship_button(user)
    c = Friendship.where(requestee_id: user.id, requester_id: current_user.id)
    d = Friendship.where(requester_id: user.id, requestee_id: current_user.id)
    if current_user != user and c.empty? and d.empty?
      form_for(:friendship, :url => user_friendships_path(user[:id])) do |f|
        f.hidden_field :requestee_id, value: user.id
        f.submit('Invite to friendship')
      end
    end
  end

  def update_friendship_button(user)
    form_with model: @friendship, method:'patch' do |f|
      f.hidden_field :requestee_id, value: user.id
      f.hidden_field :requester_id, value: current_user.id
      f.submit('Accept')
    end
  end
end



