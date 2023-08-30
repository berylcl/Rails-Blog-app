require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should include the template text' do
      expect(response.body).to include('Tom')
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:example) do
      get "/users/#{@user.id}"
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
