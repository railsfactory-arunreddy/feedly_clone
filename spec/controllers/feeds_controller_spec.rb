require 'rails_helper'

RSpec.describe FeedsController, type: :controller do
  let(:user) { create(:user) }
  let(:feed) { create(:feed) }

  describe 'GET #index' do
    it 'assigns all feeds to @feeds' do
      get :index
      expect(assigns(:feeds)).to eq(Feed.all)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested feed to @feed' do
      get :show, params: { id: feed.id }
      expect(assigns(:feed)).to eq(feed)
    end

    it 'assigns the active feed to @active_feed' do
      get :show, params: { id: feed.id }
      expect(assigns(:active_feed)).to eq(feed)
    end

    it 'assigns user subscriptions to @subscriptions' do
      user.subscriptions.create(feed: feed)
      get :show, params: { id: feed.id }
      expect(assigns(:subscriptions)).to eq([user.subscriptions.first])
    end

    it 'assigns the current user to @user' do
      sign_in user
      get :show, params: { id: feed.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      get :show, params: { id: feed.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new feed to @feed' do
      get :new
      expect(assigns(:feed)).to be_a_new(Feed)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
