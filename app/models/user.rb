class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions
  has_many :subscribed_feeds, through: :subscriptions, source: :feed
  has_many :user_article_interactions
  has_many :boards

  def read_articles
    Article.joins(:user_article_interactions)
           .where(user_article_interactions: { user_id: id, interaction_type: 'read' })
  end

  def read_later_articles
    Article.joins(:user_article_interactions)
           .where(user_article_interactions: { user_id: id, interaction_type: 'read_later' })
  end
end
