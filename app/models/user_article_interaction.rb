class UserArticleInteraction < ApplicationRecord
  belongs_to :user
  belongs_to :article

  enum interaction_type: { read: 0, read_later: 1 }
end