require 'rails_helper'

RSpec.describe FeedsController, type: :controller do
  let(:valid_attributes) {
    { title: 'Sample Feed', description: 'This is a sample feed.', url: 'www.google.com' }
  }

  let(:invalid_attributes) {
    { title: '', description: '', url: '' }
  }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all feeds as @feeds' do
      feed = Feed.create! valid_attributes
      get :index
      expect(assigns(:feeds)).to eq([feed])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      feed = Feed.create! valid_attributes
      get :show, params: { id: feed.to_param }
      expect(response).to be_successful
    end

    it 'assigns the requested feed as @feed' do
      feed = Feed.create! valid_attributes
      get :show, params: { id: feed.to_param }
      expect(assigns(:feed)).to eq(feed)
    end
  end
end
