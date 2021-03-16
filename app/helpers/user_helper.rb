module UserHelper
  def friendship_button(user)
    if current_user != user and !friendship_exist?(user, current_user)
      form_for(:friendship, :url => user_friendships_path(user[:id])) do |f|
          concat f.hidden_field :requestee_id, id: :friendship, value: user.id
          concat f.submit('Invite to friendship')
      end
    end
  end

  def update_friendship_button(user)
    @friendship = Friendship.find_friendship(user, current_user)
    if current_user != user and friendship_exist?(user, current_user) and !@friendship.empty? and @friendship[1] == 'pending'
      concat button_to 'Accept', update_friendship_path(current_user[:id], @friendship[0]),
                          params: {:friendship => {:id => @friendship[0], :status => 'accepted'}},
                          method: :patch
      button_to 'Reject', update_friendship_path(current_user[:id], @friendship[0]),
                          params: {:friendship => {:id => @friendship[0], :status => 'rejected'}},
                          method: :patch
    end
  end

  private

  def friendship_exist?(user, current_user)
    c = Friendship.find_friendship(user, current_user)
    d = Friendship.find_friendship(current_user, user)
    (c.empty? and d.empty?) ? false : true
  end

end



