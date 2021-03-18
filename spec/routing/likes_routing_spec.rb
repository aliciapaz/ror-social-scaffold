require 'rails_helper'

RSpec.describe LikesController, type: :routing do
    describe 'routing' do
        it 'routes to #create' do
            expect(post: '/posts/1/likes').to route_to('likes#create', post_id: '1')
        end

        it 'routes to #destroy' do
            expect(delete: '/posts/1/likes/1').to route_to('likes#destroy', post_id: '1', id: '1')
        end
    end
end