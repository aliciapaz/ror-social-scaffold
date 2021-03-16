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
end



