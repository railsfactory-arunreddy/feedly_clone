class ArticleBoard < ApplicationRecord
  belongs_to :article
  belongs_to :board
end
