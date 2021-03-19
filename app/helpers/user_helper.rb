module UserHelper
  # rubocop:disable Style/GuardClause
  def friendship_button(user)
    @friendship = Friendship.bidirectional_friendship(user, current_user)
    if current_user != user and @friendship.nil?
      form_for(:friendship, url: user_friendships_path(user[:id])) do |f|
        concat f.hidden_field :requestee_id, id: :friendship, value: user.id
        concat f.submit('Invite to friendship')
      end
    end
  end

  def update_friendship_button(user)
    @friendship = Friendship.unidirectional_friendship(user, current_user)
    @friendship = Friendship.find(@friendship) unless @friendship.nil?
    if current_user != user and !@friendship.nil? and @friendship[:status] == 'pending'
      concat button_to 'Accept', update_friendship_path(current_user[:id], @friendship[:id]),
                       params: { friendship: { id: @friendship[:id], status: 'accepted' } },
                       method: :patch
      button_to 'Reject', update_friendship_path(current_user[:id], @friendship[:id]),
                params: { friendship: { id: @friendship[:id], status: 'rejected' } },
                method: :patch
    end
  end
  # rubocop:enable Style/GuardClause
end
