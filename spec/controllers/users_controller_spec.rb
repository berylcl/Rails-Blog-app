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

    context 'GET show' do
      before(:example) do
        get '/users/1'
      end

      it 'success for show action' do
        expect(response).to have_http_status(:success)
      end

      it 'render correct body placeholder text for show action' do
        expect(response).to render_template(:show)
      end

      it 'render correct body placeholder' do
        expect(response.body).to include('Here is the profile page and list of posts for a specific user')
      end
    end
  end
end
