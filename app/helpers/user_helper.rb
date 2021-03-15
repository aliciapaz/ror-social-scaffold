module UserHelper
  def friendship_button(user)
    if current_user != user
      form_for(:friendship, :url => user_friendships_path(user[:id])) do |f|
        f.hidden_field :requestee_id, value: user.id
        f.submit('Invite to friendship')
      end
    end
  end
end