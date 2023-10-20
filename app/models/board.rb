class Board < ApplicationRecord
  belongs_to :user
  has_many :article_boards
  has_many :articles, through: :article_boards
end
