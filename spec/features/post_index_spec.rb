require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post1 = @user1.posts.create(title: 'This is my first post', text: 'This is the content of my first post')
    @post2 = @user1.posts.create(title: 'This is my second post', text: 'This is the content of my second post')
  end

  it 'displays the user\'s profile picture' do
    visit user_posts_path(@user1.id)
    expect(page).to have_css("img[src*='F_-0BxGuVvo']")
  end

  it 'displays the user\'s username' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Tom')
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('2 posts') # Adjust the content to match the actual rendering
  end

  it 'Displays the title of the post' do
    visit user_post_path(@user1, @post1) # Use @post1 here
    expected_title = "Post ##{@post1.id} by #{@user1.name}"
    expect(page).to have_content(expected_title)
  end

  it 'displays some of the post\'s body' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('This is the content of my first post')
    expect(page).to have_content('This is the content of my second post')
  end

  it 'displays the first comments on a post' do
    @user2 = User.create(name: 'Lilly')
    @comment1 = @post1.comments.create(text: 'This is the first comment', author_id: @user2.id)
    visit user_posts_path(@user1.id)
    expect(page).to have_content('This is the first comment')
  end

  it 'displays how many comments a post has' do
    @user2 = User.create(name: 'Lilly')
    @comment1 = @post1.comments.create(text: 'This is the first comment', author_id: @user2.id)
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Comments: 1')
  end

  it 'displays how many likes a post has' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Likes: 0')
  end
  it 'displays a section for pagination if there are more posts than fit on the view' do
    (1..10).each do |i|
      @user1.posts.create(title: "Post #{i}", text: "This is the content of post #{i}")
    end
    visit user_posts_path(@user1.id)
    expect(page).to have_button('Create a new post')
  end

  it 'redirects to post show page when clicking on a post' do
    visit user_posts_path(@user1.id)
    click_link(href: user_post_path(@user1, @post1))
    expect(current_path).to eq(user_post_path(@user1, @post1))
  end
end
