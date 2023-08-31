require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Tom')
    @post = @user1.posts.create(title: 'My Post', text: 'This is the content of my post')
    @user2 = User.create(name: 'Lilly')
    @comment = @post.comments.create(text: 'This is the first comment', author_id: @user2.id)
  end

  it 'displays who wrote the post' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content('Tom')
  end

  it 'displays how many comments it has' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content('Comments: 1')
  end

  it 'displays how many likes it has' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the post body' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content('This is the content of my post')
  end

  it 'displays the username of each commenter' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content('Lilly')
  end

  it 'displays the comment each commenter left' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content('This is the first comment')
  end
end
