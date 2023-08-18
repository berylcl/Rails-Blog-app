class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_create :increment_user_posts_counter
  def increment_user_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
