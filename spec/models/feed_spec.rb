require 'rails_helper'

RSpec.describe Feed, type: :model do
  describe ".Validations" do
    context 'Creating a feed' do
      it "successfully creates a feed with valid attributes" do
        feed = Feed.create!(title: "Test", description: "test description", url: "https://www.google.com")
        expect(Feed.count).to eq(1)
      end

      it "will not create a feed without valid attributes" do
        feed = Feed.new(title: "Test", description: "test description")
        expect(feed).not_to be_valid
      end
    end
  end
end