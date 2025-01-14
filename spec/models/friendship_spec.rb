require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:all) do
    @requester = create(:user1)
    @requestee = create(:user2)
    @lonely_user = create(:user3)
    @friendship = Friendship.create(requestee_id: @requestee[:id], requester_id: @requester[:id])
  end

  it 'is valid if unique' do
    expect(Friendship.create(requester_id: @requester[:id], requestee_id: @lonely_user[:id])).to be_valid
  end

  it 'is not valid if not unique' do
    expect(Friendship.create(requestee_id: @requester[:id], requester_id: @requestee[:id])).to_not be_valid
  end

  it 'finds a friendship between two users, no matter the direction' do
    expect(Friendship.bidirectional_friendship(@requester, @requestee)).to eq(1)
  end

  it 'returns nil if a friendship between two users does not exist, no matter the direction' do
    expect(Friendship.bidirectional_friendship(@requester, @lonely_user)).to eq(nil)
  end

  it 'finds a friendship between two users, with specific direction' do
    expect(Friendship.unidirectional_friendship(@requester, @requestee)).to eq(1)
  end

  it 'returns nil if a unidirectional friendship does not exist' do
    expect(Friendship.unidirectional_friendship(@requestee, @requester)).to eq(nil)
  end
end
