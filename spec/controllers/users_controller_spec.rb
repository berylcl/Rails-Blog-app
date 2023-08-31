require 'rails_helper'

RSpec.describe './users', type: :request do
  describe 'UsersController' do
    context 'GET index' do
      before(:example) do
        get '/users'
      end

      it 'should return success for index action' do
        expect(response).to have_http_status(:success)
      end

      it 'should render correct template for index action' do
        expect(response).to render_template(:index)
      end

      it 'correct body placeholder text for index action' do
        expect(response.body).to include('Here is the Home page for all users')
      end
    end

    context 'GET show with existing user' do
      before(:example) do
        user = User.create(name: 'John', bio: 'Bio')
        get "/users/#{user.id}"
      end

      it 'success for show action' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'GET show with non-existent user' do
      before(:example) do
        get '/users/999' # Use a non-existent user ID
      end

      it 'redirects to users_path' do
        expect(response).to redirect_to(users_path)
      end

      it 'sets a flash message' do
        expect(flash[:alert]).to eq('User not found, back to users page')
      end
    end
  end
end
