class Article < ApplicationRecord
  belongs_to :feed
  has_many :user_article_interactions
  has_many :article_boards
  has_many :boards, through: :article_boards

  def is_article_read?(user)
    
  end

end
