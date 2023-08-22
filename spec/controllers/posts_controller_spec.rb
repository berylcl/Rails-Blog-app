require 'rails_helper'

RSpec.describe './posts', type: :request do
  describe PostsController do
    context 'GET index' do
      before(:example) do
        get '/users/1/posts'
      end

      it 'returns a successful response for index action' do
        expect(response).to be_successful
      end

      it 'renders the correct template' do
        expect(response).to render_template(:index)
      end

      it 'renders the correct body placeholder text' do
        expect(response.body).to include("Here is the Home page for user's posts")
      end
    end

    context 'GET show action' do
      before(:example) do
        get '/users/1/posts/1'
      end

      it 'has a successful response for show action' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the correct template for the show action' do
        expect(response).to render_template(:show)
      end

      it 'renders the correct placeholder' do
        expect(response.body).to include('Here are the specific posts by a user')
      end
    end
  end
end
