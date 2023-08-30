require 'rails_helper'

RSpec.describe 'Post views', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = @user1.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
    @user1.posts.create(title: 'This is my second post', text: 'This is the content of my second post')
    @user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo1', bio: 'Teacher from Poland')
    @post.comments.create(text: 'This is the first comment', author_id: @user2.id)
  end

  describe 'post show page' do

    it 'should show user\'s name' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Tom')
    end

    it 'should show the number of comments' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'should show the number of likes' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Likes: 0')
    end

    it 'should see post\'s body' do
      visit user_post_path(@user1.id, @post.id)
      expect(page).to have_content('This is the content of my first post')
    end

    it 'should see the first comment' do
      visit user_post_path(@user1.id, @post.id)
      expect(page).to have_content('This is the first comment')
    end

    it 'should see the number of comments' do
      visit user_post_path(@user1.id, @post.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'should see the number of likes' do
      visit user_post_path(@user1.id, @post.id)
      expect(page).to have_content('Likes: 0')
    end
  end
end
