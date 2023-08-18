require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_likes_counter' do
    it 'updates the post likes_counter attributes' do
      user = User.create(name: 'King')
      post = Post.create(title: 'Hello', author: user)
      like = Like.create(author: user, post:)
      like.increment_post_likes_counter
      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
