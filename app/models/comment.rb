class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  attribute :text, :text
  after_create :increment_post_comments_counter

  def increment_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
