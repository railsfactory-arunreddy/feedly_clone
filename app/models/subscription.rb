class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :feed

  broadcasts_to :feeds
end
