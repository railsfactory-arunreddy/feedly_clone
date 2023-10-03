class Feed < ApplicationRecord
  validates_presence_of :title, :url
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :articles

  broadcasts
end
