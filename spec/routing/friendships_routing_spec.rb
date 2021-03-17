require 'rails_helper'

RSpec.describe FriendshipsController, type: :routing do
    describe 'routing' do
        it 'routes to #create' do
        expect(post: '/users/1/friendships').to route_to('friendships#create', user_id: '1')
        end
    end
end