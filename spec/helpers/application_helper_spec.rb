require 'rails_helper'

# RSpec.describe ApplicationHelper, type: :system do
#     describe 'index page' do
#         it 'shows like_or_dislike_btn' do
#             @user = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
#             visit new_user_registration_path 
#             fill_in 'Name', with: @user.name
#             fill_in 'Email', with: @user.email
#             fill_in 'Password', with: @user.password
#             fill_in 'Password confirmation', with: @user.password
#             click_on 'Sign up'
#             expect(page).to have_content('Like!')
#         end
#     end
# end