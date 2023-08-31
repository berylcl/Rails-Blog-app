require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
    @post = Post.create(title: 'This is my first post', text: 'Some content', author_id: @user.id)
  end
  describe 'GET #index' do
    before(:example) do
      get "/users/#{@user.id}/posts"
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should include the template text' do
      expect(response.body).to include('Tom')
    end

    it 'should render template correctly' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:example) do
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'should render template correctly' do
      expect(response).to render_template(:show)
    end

    it 'should be successful' do
      expect(response).to have_http_status(:ok)
    end
  end
end
